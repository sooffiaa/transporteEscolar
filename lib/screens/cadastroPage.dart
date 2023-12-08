
import 'package:appescolar/database/database_helper.dart';
import 'package:appescolar/logica/alert_dialog.dart';
import 'package:appescolar/models/usuario_model.dart';
import 'package:appescolar/screens/LoginPage.dart';
import 'package:appescolar/screens/custom_text_form_field.dart';
import 'package:appescolar/screens/homePage.dart';
import 'package:flutter/material.dart';

class cadastroPage extends StatefulWidget {
  const cadastroPage({super.key});

  @override
  State<cadastroPage> createState() => _cadastroPageState();
}


class _cadastroPageState extends State<cadastroPage> {
  //nossa key
  final _formKey = GlobalKey<FormState>();
  //nossos controllers para escutar o que o usuário está digitando nos texts fields
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  //variavel do nosso banco de dados
  var dbHelper;


  //função que insere um novo usuário na nossa tabela
  signUp() async {
    FocusManager.instance.primaryFocus?.unfocus();

    String userName = userNameController.text;
    String email = emailController.text;
    String pass = passController.text;

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      UserModel? uModel = UserModel(
        userName,
        email,
        pass,
      );
      await dbHelper.saveData(uModel).then((userData) {
        alertDialog(context, "Usuário cadastrado com sucesso!");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        );
      }).catchError((error) {
        alertDialog(context, "Erro ao realizar cadastro");
      });
    }
  }

  @override
  void initState() {
    super.initState();
    dbHelper = DatabaseHelper();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:_body(context)
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
            SizedBox(height: 50,),
            SizedBox(child: Text('Cadastro', ),),

            CustomTextFormField(
              hintName: 'Nome do responsável',
            ),
            SizedBox(height: 10,),

            CustomTextFormField(
              hintName: 'Nome da criança',
            ),
            SizedBox(height: 10,),

            CustomTextFormField(
              hintName: 'Email',
            ),
            SizedBox(height: 10,),
            CustomTextFormField(
              hintName: 'Senha'
            ),

             SizedBox(height: 40,),

            ElevatedButton(
      onPressed: (){
        Navigator.push(context, (
          MaterialPageRoute(builder: (context)=> LoginPage(),)));
        
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius:BorderRadius.circular(10),
        ),
        primary: Color.fromARGB(255, 2, 57, 80),
         minimumSize: Size(300, 50),
      ),
      child: Text(
        "Cadastrar",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    ),
          ],
        ),
      ),
      ),
  );
}
