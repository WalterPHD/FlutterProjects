
import 'package:flutter/material.dart';

class ListaProduto extends StatelessWidget{

  final List<String> produtos = [
    'Gartic Monkeys',
    'Before',
    'Tarnished',
    'Juspiters acending',
    'Space',
  ];

  final List<String> descricoes = [
    'Garctic Monkey wordlwibe tour in alaska',
    'Alone is this you Utopias new news',
    'The akindled, unkowing of their destiny',
    'Jupiters, new storm acending',
    'Enough is enough so im gone',
  ];

  final List<String> imagens = [
    'assets/monkey-4k.jpg',
    'assets/nightsky-4k.jpg',
    'assets/oled-4k-dk.jpg',
    'assets/Sky-4k.webp',
    'assets/space-4k.jpg',
  ];

  ListaProduto({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Albums'),
      ),
      body: ListView.builder(
        itemCount: produtos.length,
        itemBuilder: (context, index){
          return ListTile(
            leading: Image.asset(imagens[index],
            width: 60,
            height: 60,
            fit: BoxFit.fill,),
            title: Text(produtos[index],
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold),),
              subtitle: Text(descricoes[index],
              style: TextStyle(
                fontSize: 14
              ),),
          );
        },
      ),
    );
  }
}