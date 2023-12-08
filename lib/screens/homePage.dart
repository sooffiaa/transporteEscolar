import 'package:appescolar/screens/bottomNavigationWidget.dart';
import 'package:appescolar/widgets/loginButton.dart';
import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }
}

_body(BuildContext context)
{ 
  return SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Você conseguiu logar',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Container(
                height: 350,
                width: 320,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 255, 255, 255),
                      spreadRadius: 3,
                      blurRadius: 3,
                    ),
                  ],
                  image: const DecorationImage(
                      image: AssetImage('assets/images/check.png'),
                      fit: BoxFit.fill),
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () 
                {},
                
                child: const Text('Voltar'),
              ),
            ],
          ),
        ),
      );
}