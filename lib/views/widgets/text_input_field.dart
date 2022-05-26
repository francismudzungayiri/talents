import 'package:flutter/material.dart';
import 'package:talents/constants.dart';

class TextInput extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final bool isObscure;

  const TextInput({ 
    Key? key,
    required this.controller, 
    required this.label, 
    required this.icon, 
    this.isObscure = false,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isObscure,
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        labelStyle: const TextStyle(fontSize: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: borderColor
          ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: borderColor,
            )
          )
      ),
    );
  }
}