
import 'package:exercicio1/semana%208/ListaProduto.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
    
@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: ListaProduto(),
    );
  }
}