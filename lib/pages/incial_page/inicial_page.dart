// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../../core/constants/bytebank_style.dart';
import '../../service/sharedpreferences_service.dart';

class IncialPage extends StatefulWidget {
  const IncialPage({super.key});

  @override
  State<IncialPage> createState() => _IncialPageState();
}

class _IncialPageState extends State<IncialPage> {
  List<String> usuarios = [];
  final TextEditingController _controllerName = TextEditingController();
  final SharedPreferencesService _userService = SharedPreferencesService();

  Future<void> carregarUsuarios() async {
    usuarios = await _userService.lerUsuarios();
    setState(() {});
  }

  Future<void> incrementarUsuarios(String usuario) async {
    await _userService.incrementarUsuarios(usuario);
    await carregarUsuarios();
  }

  @override
  void initState() {
    super.initState();
    carregarUsuarios();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: ByteBankStyle.green,
        onPressed: () {
          showAddUsuario(context);
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: ByteBankStyle.green,
        title: const Text('Transfêrencias'),
        actions: [
          Text(_userService.nomeDigitado),
        ],
      ),
      body: ListView.builder(
        itemCount: usuarios.length,
        itemBuilder: (context, index) {
          return cardUsuarios(index);
        },
      ),
    );
  }

  Future<dynamic> showAddUsuario(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Column(
          children: [
            Text('Adicionar usuário'),
            TextFormField(
              controller: _controllerName,
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Não'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      incrementarUsuarios(_controllerName.text);
                    });
                  },
                  child: Text('Sim'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Card cardUsuarios(int index) {
    return Card(
      child: ListTile(
        title: Text(
          usuarios[index],
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
