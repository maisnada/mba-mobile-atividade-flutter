import 'dart:convert';

import 'package:localstorage/localstorage.dart';

class SessionRepositort {
  final LocalStorage _storage = LocalStorage("session.json");

  final String _key = 'LOGGED_USER';

  Future<void> setLoggedUser(dynamic user) async {
    await _storage.setItem(_key, jsonEncode(user));
  }

  Future<dynamic> getLoggedUser() async {
    final json = await _storage.getItem(_key);

    return jsonDecode(json);
  }

  Future<void> removeLoggedUser() async {
    await _storage.deleteItem(_key);
  }
}
