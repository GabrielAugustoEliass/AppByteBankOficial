import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  final TextEditingController controllerUsuario = TextEditingController();

  String nomeDigitado = '';

  void lerNomeDigitado() {
    nomeDigitado = controllerUsuario.text;
  }

  Future<List<String>> lerUsuarios() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('usuarios') ?? [];
  }

  Future<void> incrementarUsuarios(String usuario) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> usuarios = await lerUsuarios();
    usuarios.add(usuario);
    await prefs.setStringList('usuarios', usuarios);
  }
}
