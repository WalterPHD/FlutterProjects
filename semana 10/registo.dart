import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // class _RegistarState extends State<RegisterScreen>{
  String? gender;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:Scaffold(
          appBar: AppBar(
            title: Text('Registrar'),
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
                            labelText: 'Nome'
                        )
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child:
                    Text('Genero'),
                    ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child:
                    RadioListTile<String>(
                        title: const Text('Masculino'),
                        value: 'Masculino',
                        groupValue: gender,
                        onChanged: (value) => gender,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child:
                    RadioListTile<String>(
                      title: const Text('Feminino'),
                      value: 'Feminino',
                      groupValue: gender,
                      onChanged: (value) => gender,
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
                          labelText: 'Senha'
                      ),
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
                          labelText: 'Idade'
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: (){},
                      child: Text('Registrar')
                  ),
                ],)
          ),
        )
    );

  }
}
