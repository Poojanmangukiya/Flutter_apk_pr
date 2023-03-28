import 'package:api_example2/apistore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: ProductListPage(),
    );
  }
}

class ProductListPage extends StatefulWidget {
  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final ApiLoderw = ApiLoder();
  @override
  void initState() {
    super.initState();
    ApiLoderw.loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 216, 130, 24),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.menu),
          )
        ],
        title: Text('Product List'),
      ),
      body: Observer(
        builder: (BuildContext context) {
          return RawScrollbar(
            crossAxisMargin: 3.5,
            thumbColor: Color.fromARGB(255, 163, 94, 11),
            radius: Radius.circular(10),
            thickness: 12,
            thumbVisibility: true,
            trackVisibility: true,
            child: ListView.builder(
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.all(8),
              itemCount: ApiLoderw.products.length,
              itemBuilder: (BuildContext context, int index) {
                final product = ApiLoderw.products[index];

                return Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        height: 40,
                        width: 400,
                        child: Center(
                          child: Text(
                            product['title'],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(blurRadius: 10, color: Colors.black54),
                            ],
                            color: Color.fromARGB(127, 163, 95, 11)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          padding: EdgeInsets.all(10),
                          height: 300,
                          width: 500,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 10, color: Colors.grey)
                                    ],
                                    color: Colors.white),
                                height: 200,
                                width: 300,
                                child: Image.network(
                                  product['thumbnail'],
                                ),
                              ),
                              Text(
                                product['description'],
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: Colors.black87),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(145, 212, 212, 206))),
                    ],
                  ),
                );
                // leading: Image.network(product['thumbnail']),
                // title: Text(product['title']),
                // subtitle: Text(product['description']),
              },
            ),
          );
        },
      ),
    );
  }
}
