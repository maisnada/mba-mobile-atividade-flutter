import 'package:app_aula1306/pages/formulario.dart';
import 'package:app_aula1306/pages/login.dart';
import 'package:flutter/material.dart';

import '../services/user_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  final String title = 'Usuarios';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  final _userService = Userervice();

  Future<List<dynamic>> fetchUsers() async {
    try {
      return await _userService.getList();
    } catch (e) {
      return [];
    }
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              icon: const Icon(Icons.logout)),
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => FormularioPage()),
                );
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Center(
        child: FutureBuilder(
          future: fetchUsers(),
          builder: (context, snapshot) {
            final users = snapshot.data ?? [];
            return _buildView(users);
          },
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildView(List<dynamic> users) {
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            title: Text(user['name']),
            subtitle: Text(user['username']),
          );
        });
  }
}
