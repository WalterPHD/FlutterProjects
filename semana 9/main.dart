
import 'package:exercicio1/semana%209/GridProduto.dart';
import 'package:exercicio1/semana%209/ListView.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MainApp());
}
class MainApp extends StatelessWidget{
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    const title = 'ListHorizontal';

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu),),
          title: const Text(title),
          actions: [IconButton(onPressed: (){}, icon: Icon(Icons.settings))],
        ),
        // body: Text('Teste'),
        // backgroundColor: Colors.amberAccent[180],
        body:
        Column(
          children: [
            SizedBox(
              height: 50,
              child: MyListView(),),
              Expanded(child: MyGridView()),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
    );
  }
}