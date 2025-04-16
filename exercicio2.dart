import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "Product Catalog",
              style: TextStyle(
              color: Colors.white
              ),
            ),
            backgroundColor: Colors.blue,

          ),
          body:
          Column(
            children: [
              Expanded(//Expand
                child :
                Container(
                  color: Colors.blue,
                  child:
                  Center(child: Text("Product 1")),
                ),
              ),
          Expanded(//Expand
            child :
                Container(
                  color: Colors.green,
                  child:
                  Center(child: Text("Product 2")),
                ),
        ),
              Expanded(//Expand
                child :
                Container(
                  color: Colors.orange,
                  child:
                  Center(child: Text("Product 3")),
                ),
              ),
            ],
          ),
        )
    );
  }
}
