// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:bytebank/pages/login/widgets/input_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/bytebank_style.dart';
import '../../service/sharedpreferences_service.dart';
import '../incial_page/inicial_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final SharedPreferencesService _userService = SharedPreferencesService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 130, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'images/logobytebank.png',
                  height: 65,
                ),
                SizedBox(height: 70),
                InputLogin(
                  controller: _userService.controllerUsuario,
                  texto: 'Nome do usuário',
                  icon: Icon(Icons.person),
                  keyboardType: TextInputType.name,
                ),
                InputLogin(
                  texto: 'Senha',
                  icon: Icon(Icons.key),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 25),
                BottomLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  ElevatedButton BottomLogin() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ByteBankStyle.green,
      ),
      onPressed: () {
        _userService.lerNomeDigitado();
        _userService.controllerUsuario.clear();
        _userService.nomeDigitado;
        Get.to(IncialPage());
      },
      child: Text(
        'Fazer Login',
        style: TextStyle(fontSize: 17),
      ),
    );
  }
}
