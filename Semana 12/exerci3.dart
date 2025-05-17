import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart'; // Importar permission_handler
import 'package:flutter/foundation.dart' show kIsWeb; // Para verificar se é web

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Salvar Formulário em TXT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FormScreen(),
    );
  }
}

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  // Função para obter o diretório de armazenamento externo público (Documentos)
  Future<String?> _getExternalDocumentsPath() async {
    if (kIsWeb) {
      // Não aplicável para web
      return null;
    }

    // Solicitar permissão de armazenamento (pode ser necessário dependendo da versão do Android)
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      status = await Permission.storage.request();
      if (!status.isGranted) {
        return null; // Permissão negada
      }
    }

    // Tenta obter o diretório de armazenamento externo
    // Nota: Esta abordagem pode não funcionar em todas as versões do Android devido ao Scoped Storage
    final directory = await getExternalStorageDirectory();
    if (directory != null) {
      // Construir o caminho para a pasta "Documents"
      // Nota: O caminho exato pode variar entre dispositivos e versões do Android
      return '${directory.path.split('/Android')[0]}/Documents';
    }
    return null;
  }

  Future<File?> _localFileExternal() async { // async movido para cá
    final path = await _getExternalDocumentsPath();
    if (path != null) {
      // Criar o diretório se ele não existir
      final directory = Directory(path);
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }
      return File('$path/form_data.txt'); // Nome do arquivo
    }
    return null;
  }

  Future<File?> _saveFormDataExternal() async {
    final file = await _localFileExternal(); // <-- Adicionado os parênteses ()

    if (file != null) {
      // Formata os dados para salvar no arquivo
      String dataToSave = 'Nome: ${_nameController.text}\n'
          'Email: ${_emailController.text}\n'
          'Mensagem: ${_messageController.text}\n';

      // Escreve a string no arquivo
      return file.writeAsString(dataToSave);
    }
    return null; // Não foi possível obter o arquivo
  }

// Função para lidar com o clique do botão salvar
void _handleSaveButtonClick() async {
  // Basic validation
  if (_nameController.text.isEmpty || _emailController.text.isEmpty ||
      _messageController.text.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Por favor, preencha todos os campos')),
    );
    return;
  }

  try {
    // Tenta salvar no armazenamento externo público
    final savedFile = await _saveFormDataExternal();

    if (savedFile != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Dados salvos com sucesso na pasta Documentos!')),
      );
      // Opcional: Limpar os campos após salvar
      _nameController.clear();
      _emailController.clear();
      _messageController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(
            'Erro ao salvar dados: Não foi possível acessar a pasta Documentos ou permissão negada.')),
      );
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Erro ao salvar dados: $e')),
    );
    print('Erro ao salvar arquivo: $e'); // Para depuração
  }
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Formulário de Dados'),
    ),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView( // Permite rolar se o conteúdo for muito grande
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _messageController,
              decoration: InputDecoration(
                labelText: 'Mensagem',
                border: OutlineInputBorder(),
              ),
              maxLines: 5, // Permite múltiplas linhas para a mensagem
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: _handleSaveButtonClick,
              child: Text('Salvar em Documentos'),
            ),
          ],
        ),
      ),
    ),
  );
}}