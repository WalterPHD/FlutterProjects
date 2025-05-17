import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JSON ListView Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: JsonListViewScreen(),
    );
  }
}

// Modelo de dados para um item
class Item {
  final String name;
  final double price;

  Item({required this.name, required this.price});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      name: json['name'],
      price: json['price'].toDouble(), // Converte para double
    );
  }
}

class JsonListViewScreen extends StatefulWidget {
  @override
  _JsonListViewScreenState createState() => _JsonListViewScreenState();
}

class _JsonListViewScreenState extends State<JsonListViewScreen> {
  List<Item> _items = []; // Lista para armazenar os objetos Item

  @override
  void initState() {
    super.initState();
    _loadJsonData(); // Carrega os dados JSON ao inicializar a tela
  }

  // Função para carregar e decodificar o JSON
  Future<void> _loadJsonData() async {
    try {
      // Carrega o conteúdo do arquivo JSON como uma string
      String jsonString = await rootBundle.loadString('assets/items.json');
      // Decodifica a string JSON em uma lista dinâmica
      List<dynamic> jsonList = jsonDecode(jsonString);
      // Mapeia a lista dinâmica para uma lista de objetos Item
      setState(() {
        _items = jsonList.map((json) => Item.fromJson(json)).toList();
      });
    } catch (e) {
      print('Erro ao carregar ou decodificar JSON: $e');
      // Opcional: mostrar um SnackBar de erro
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao carregar dados')),
      );
    }
  }

  // Função para exibir o preço no SnackBar
  void _showPriceSnackBar(double price) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Preço: R\$ ${price.toStringAsFixed(2)}'), // Formata o preço
        duration: Duration(seconds: 2), // Duração do SnackBar
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Itens'),
      ),
      body: _items.isEmpty
          ? Center(child: CircularProgressIndicator()) // Mostra um indicador de carregamento enquanto os dados são carregados
          : ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final item = _items[index];
          return ListTile(
            title: Text(item.name),
            onTap: () {
              _showPriceSnackBar(item.price); // Chama a função para mostrar o SnackBar
            },
          );
        },
      ),
    );
  }
}