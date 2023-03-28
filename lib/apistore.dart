import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

part "apistore.g.dart";

class ApiLoder = BaseApiLoder with _$ApiLoder;

abstract class BaseApiLoder with Store {
  @observable
  List<dynamic> products = [];

  @action
  Future<void> loadProducts() async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products'));
    if (response.statusCode == 200) {
      products = jsonDecode(response.body)['products'];
    } else {
      throw Exception('Failed to load products');
    }
  }
}
