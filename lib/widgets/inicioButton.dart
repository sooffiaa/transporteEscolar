import 'package:flutter/material.dart';

class inicioButton extends StatefulWidget {
  const inicioButton({super.key});

  @override
  State<inicioButton> createState() => __inicioButtonState();
}

class __inicioButtonState extends State<inicioButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){},
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius:BorderRadius.circular(0),
        ),
        primary: Color.fromARGB(255, 25, 73, 93),
         minimumSize: Size(300, 50),
      ),
      child: Text(
        "Continuar",
        style: TextStyle(
          fontFamily: 'Jaldi',
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Color.fromARGB(255, 253, 253, 253),
        ),
      ),
    );
  }
}