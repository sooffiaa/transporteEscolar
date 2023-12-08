import 'package:appescolar/database/database_helper.dart';
import 'package:appescolar/logica/alert_dialog.dart';
import 'package:appescolar/models/usuario_model.dart';
import 'package:appescolar/screens/cadastroPage.dart';
import 'package:appescolar/screens/custom_text_form_field.dart';
import 'package:appescolar/screens/homePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
//preferencias de usuário
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  //form key
  final _formKey = GlobalKey<FormState>();
  //controllers para pegar o email e a senha
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  //variável da base de dados
  var dbHelper;

  //função que realiza a verificação do email e da senha no banco de dados
  login() async {
    FocusManager.instance.primaryFocus?.unfocus;
    String email = emailController.text;
    String pass = passwordController.text;

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      await dbHelper.getLoginUser(email, pass).then((userData) {
        if (userData != null) {
          setSP(userData).whenComplete(() {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => homePage()), //colocar o userData
                (Route<dynamic> route) => false);
          });
        } else {
          alertDialog(context, "Erro, usuário não encontrado!");
        }
      }).catchError((error) {
        alertDialog(context, "Erro ao fazer login!");
      });
    }
  }
  
  Future setSP(UserModel user) async {
    final SharedPreferences sp = await _pref;
    sp.setString("userName", user.userName);
    sp.setString("email", user.email);
    sp.setString("password", user.password);
  }

  @override
  void initState() {
    super.initState();
    dbHelper = DatabaseHelper();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _body(context),
    );
  }
}

_body(BuildContext context){
  return SingleChildScrollView(
    child: Form(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 100,),
            SizedBox(child: Image.asset("assets/images/logoazul.png"), height: 200, width: 200,),
            SizedBox(height: 50,),
            CustomTextFormField(
              hintName: 'Email',
            ),
            SizedBox(height: 20,),
            CustomTextFormField(
              hintName: 'Senha'
            ),

             SizedBox(height: 40,),

            ElevatedButton(
      onPressed: (){
        Navigator.push(context, (
          MaterialPageRoute(builder: (context)=> cadastroPage(),)));
        
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
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    ),

            Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Não tem uma conta? '),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const cadastroPage(),
                          ),
                        );
                      },
                      child: const Text('Registre-se'),
                    ),
                  ],
                ),
          ],
        ),
      ),
      ),
  );
}