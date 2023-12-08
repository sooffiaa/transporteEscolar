import 'package:appescolar/screens/cadastroPage.dart';
import 'package:flutter/material.dart';
import 'package:appescolar/screens/bottomNavigationWidget.dart';

class loginButton extends StatefulWidget {
  const loginButton({super.key});

  @override
  State<loginButton> createState() => _loginButtonState();
}

class _loginButtonState extends State<loginButton> {
  @override
  Widget build(BuildContext context) {
        return ElevatedButton(
      onPressed: (){
        Navigator.push(context, (
          MaterialPageRoute(builder: (context)=> BottomNavigationWidget(),)));
        
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius:BorderRadius.circular(10),
        ),
        primary: Color.fromARGB(255, 2, 57, 80),
         minimumSize: Size(300, 50),
      ),
      child: Text(
        "Logar",
        style: TextStyle(
          fontFamily: 'Jaldi',
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    );
  }

}