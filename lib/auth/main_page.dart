//Se importa el paquete de flutter framework
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login/auth/auth_page.dart';
import 'package:login/pages/home_page.dart';
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    //Scaffold: para darle un diseño a la hoja
    return Scaffold(
      //Se genera el usuario
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          //Si el usuario existe, este nos envia homepage
          if(snapshot.hasData){
            return const HomePage();
          }
          //Sino entonces hay que autenticar
          else{
            return const AuthPage();
          }
        }
      ),
    );
  }
}
