import 'package:flutter/material.dart';

class emailField extends StatefulWidget {
  const emailField({Key? key}) : super(key: key);

  @override
  State<emailField> createState() => _emailFieldState();
}

class _emailFieldState extends State<emailField> {
  //Color minhaCor = Color(0xFF696D93);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.0,
      height: 50.0,
    child:TextFormField(
      keyboardType: TextInputType.text,
      style: TextStyle(
        fontSize: 20,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder( borderRadius: BorderRadius.circular(8.0),),
        labelText: 'E-mail',
            labelStyle: TextStyle(
              fontSize: 18,
            ),
      ),
    ),
    );
  }
}