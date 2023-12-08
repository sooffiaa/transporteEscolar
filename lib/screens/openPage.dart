import 'package:appescolar/widgets/inicioButton.dart';
import 'package:flutter/material.dart';

class openPage extends StatefulWidget {
  const openPage({super.key});

  @override
  State<openPage> createState() => _openPageState();
}

class _openPageState extends State<openPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
  
    );
  }
}

_body()
{
  return Form(
    child: ListView(
    padding: EdgeInsets.all(20),
    children: <Widget>
    [
      SizedBox(height: 40,),
       SizedBox(child: Image.asset("assets/images/logoazul.png"), height: 200, width: 200,),
       SizedBox(height: 20,),
        Container(
          alignment: Alignment.center,
          //child: Text("Transporte escolar", style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500,color: Colors.black),),
        ),
        SizedBox(height: 280,),
        Text("Bem Vindo ao", style: TextStyle(fontSize: 50,fontWeight: FontWeight.w400,color: Colors.black),),
      inicioButton(),
    ],
  ),);
}