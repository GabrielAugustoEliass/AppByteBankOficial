import 'package:flutter/material.dart';

class InputLogin extends StatelessWidget {
  final String texto;
  final Icon icon;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  const InputLogin({
    super.key,
    required this.texto,
    required this.icon,
    required this.keyboardType,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[100],
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.green),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.green),
          ),
          labelText: texto,
          labelStyle: const TextStyle(fontSize: 17),
          prefixIcon: icon,
        ),
      ),
    );
  }
}
