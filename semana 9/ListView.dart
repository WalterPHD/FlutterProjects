import 'package:exercicio1/semana%209/ListaProduto.dart' show ListDataItems;
import 'package:flutter/material.dart';

class MyListView extends StatelessWidget{
  MyListView({super.key});

  final ListDataItems items = ListDataItems();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: items.meses.length,
      itemBuilder: (context, index){
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 120,
              child: ListTile(
                title: Text(items.meses[index]),
                onTap: (){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: Duration(seconds: 2,milliseconds: 5),
                      content: Text('Selecionado ${items.meses[index]}',
                      style: TextStyle(fontSize: 16, color: Colors.blueAccent),),
                    )
                  );
                },
              ),
            )
          ],
        );
      },
    );
  }

}