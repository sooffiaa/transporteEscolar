import 'package:appescolar/logica/validate_email.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  TextEditingController? controller;
  String? hintName;
  IconData? icon;
  bool isObscureText;
  TextInputType? inputType;
  bool? isEnable;

  CustomTextFormField({
    this.controller,
    this.hintName,
    this.icon,
    this.isObscureText = false,
    this.inputType = TextInputType.text,
    this.isEnable = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: controller,
        obscureText: isObscureText,
        enabled: isEnable,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Favor preencher o campo $hintName.';
          }
          if (hintName == "Email" && !validateEmail(value)) {
            return 'Por favor, insira um email válido.';
          }
          return null;
        },
        decoration: InputDecoration(
          border: OutlineInputBorder( borderRadius: BorderRadius.circular(8.0),),
            labelStyle: TextStyle(
              fontSize: 18,
            ),
            hintText: hintName,
          labelText: hintName,
        ),
      ),
    );
  }
}