// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apistore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ApiLoder on BaseApiLoder, Store {
  late final _$productsAtom =
      Atom(name: 'BaseApiLoder.products', context: context);

  @override
  List<dynamic> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(List<dynamic> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  late final _$loadProductsAsyncAction =
      AsyncAction('BaseApiLoder.loadProducts', context: context);

  @override
  Future<void> loadProducts() {
    return _$loadProductsAsyncAction.run(() => super.loadProducts());
  }

  @override
  String toString() {
    return '''
products: ${products}
    ''';
  }
}
