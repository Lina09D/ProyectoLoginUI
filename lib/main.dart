//Se importa el paquete de flutter framework
import 'package:flutter/material.dart';
//Es la hoja de inicio
import 'auth/main_page.dart';
//importamos el firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

//Void es una funcion que no,nos retorna
void main()async {
  //llamamos el codigo nativo para hacer la conexion con el firebase
  WidgetsFlutterBinding.ensureInitialized();
  //Esperamos la respuesta del firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //Quitamos el banner que tiene por defecto
      debugShowCheckedModeBanner: false,
      //y vamos a la siguiente hoja
      home: MainPage(),
    );
  }
}



