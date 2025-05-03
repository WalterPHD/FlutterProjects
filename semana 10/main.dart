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
            title: Text('Login'),
          ),
          body:
              //Padding(
            // padding: const EdgeInsets.all(20
          // no uso do padding nao precisa de meter containers, porque ja estao
          // em colunas )
            Center(
              child:
              Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.black,
                          width: 1,
                        )
                      )
                    ),
                    child: TextField(
                        decoration: InputDecoration(
                            labelText: 'Email'
                        )
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Colors.black,
                                width: 1
                            )
                        )
                    ),
                    child: TextField(
                      obscureText: true,
                      obscuringCharacter: '*',
                      decoration: InputDecoration(
                          labelText: 'Password'
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: (){}, 
                      child: Text('Entrar')
                  ),
                  TextButton(
                      onPressed: (){},
                      child: Text('Criar Conta')
                  )
                ],)
            ),
        )
    );
  }
}
