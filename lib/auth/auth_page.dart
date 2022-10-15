//Se importa el paquete de flutter framework
import 'package:flutter/material.dart';
import 'package:login/pages/Login_page.dart';
import 'package:login/pages/register_page.dart';
//StatefulWidget permite lectura y escritura
class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  //se crea variable booleana que contendra el inicio de sesion
  bool showLoginPage = true;

  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    //Se sealiza el registro
    if (showLoginPage) {
      return Loginpage(showRegisterPage: toggleScreens);
    }
    //Sino entonces este devuelve al login

    else {
      return RegisterPage(showLoginPage:toggleScreens);
    }
  }
}
