import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Salvar Nome Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', // Define a rota inicial
      routes: {
        '/': (context) => InputNameScreen(), // Rota para a tela de entrada de nome
        '/display': (context) => DisplayNameScreen(), // Rota para a tela de exibição de nome
      },
    );
  }
}

// Primeira Tela: Entrada de Nome
class InputNameScreen extends StatefulWidget {
  @override
  _InputNameScreenState createState() => _InputNameScreenState();
}

class _InputNameScreenState extends State<InputNameScreen> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  // Função para salvar o nome em SharedPreferences
  Future<void> _saveName() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', _nameController.text);
    // Navega para a próxima tela após salvar
    Navigator.pushNamed(context, '/display');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inserir Nome'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Digite seu nome',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveName,
              child: Text('Salvar Nome'),
            ),
          ],
        ),
      ),
    );
  }
}

// Segunda Tela: Exibição de Nome
class DisplayNameScreen extends StatefulWidget {
  @override
  _DisplayNameScreenState createState() => _DisplayNameScreenState();
}

class _DisplayNameScreenState extends State<DisplayNameScreen> {
  String _userName = 'Nome não encontrado'; // Valor padrão

  @override
  void initState() {
    super.initState();
    _loadName(); // Carrega o nome ao inicializar a tela
  }

  // Função para carregar o nome de SharedPreferences
  Future<void> _loadName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefs.getString('userName') ?? 'Nome não encontrado';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nome Salvo'),
      ),
      body: Center(
        child: Text(
          'Olá, $_userName!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}