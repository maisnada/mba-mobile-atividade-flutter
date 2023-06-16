import 'package:app_aula1306/pages/home.dart';
import 'package:flutter/material.dart';

import '../services/user_service.dart';

class FormularioPage extends StatefulWidget {
  const FormularioPage({super.key});

  @override
  State<FormularioPage> createState() => _FormularioPageState();
}

class _FormularioPageState extends State<FormularioPage> {
  //final TextEditingController

  String _nome = "";
  String _username = "";
  String _password = "";
  String _retryPassword = "";

  final _userService = Userervice();

  void _cadastrar() {
    if (!_nome.trim().isEmpty &&
        !_username.trim().isEmpty &&
        !_password.trim().isEmpty &&
        (_password == _retryPassword)) {
      _userService.adicionar(_nome, _username, _password).then((value) => {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage()),
            )
          });
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Confirme seus dados'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cadastro"),
        ),
        body: Column(
          children: [
            TextFormField(
              autocorrect: false,
              enableSuggestions: false,
              decoration: const InputDecoration(labelText: 'Nome'),
              onChanged: (value) => setState(() {
                _nome = value;
              }),
            ),
            TextFormField(
              autocorrect: false,
              enableSuggestions: false,
              decoration: const InputDecoration(labelText: 'Usuario'),
              onChanged: (value) => setState(() {
                _username = value;
              }),
            ),
            TextFormField(
                autocorrect: false,
                enableSuggestions: false,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Senha'),
                onChanged: (value) => setState(() {
                      _password = value;
                    })),
            TextFormField(
                autocorrect: false,
                enableSuggestions: false,
                obscureText: true,
                decoration:
                    const InputDecoration(labelText: 'Confirme a senha'),
                onChanged: (value) => setState(() {
                      _retryPassword = value;
                    })),
            ElevatedButton(onPressed: _cadastrar, child: Text("Cadastrar"))
          ],
        ));
  }
}
