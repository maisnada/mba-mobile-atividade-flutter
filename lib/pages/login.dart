import 'package:app_aula1306/pages/home.dart';
import 'package:app_aula1306/services/auth_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _username = "";
  String _password = "";

  final authService = AuthService();

  void _singIn() {
    authService.login(_username, _password).then((logged) {
      if (logged == null) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Login invalido'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Acesso"),
        ),
        body: Column(
          children: [
            TextFormField(
              autocorrect: false,
              enableSuggestions: false,
              decoration: const InputDecoration(labelText: 'Login'),
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
            ElevatedButton(onPressed: _singIn, child: Text("Entrar"))
          ],
        ));
  }
}
