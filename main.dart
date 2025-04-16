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
          title: Text('Exemplo 1'),
        ),
        body:
        Center(
          child:
          Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              width: 100,
              height: 150,
              color: Colors.amber,
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.cyan,
            ),
            SizedBox(
              width: 20,
            )
          ],),
        ),
      )
    );
  }
}
