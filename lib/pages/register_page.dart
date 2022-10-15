//Se importa el paquete de flutter framework
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
//este paquete nos ayuda a utilizar fuentes de google
import 'package:google_fonts/google_fonts.dart';
//StatefulWidget: permite hacer lectura y escritura
class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;

  const RegisterPage({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}
//Aqui se controlan todos los campos que se van a recibir
class _RegisterPageState extends State<RegisterPage> {
  //en esta parte controlamos todos los campos que vamos a recibir
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _userProfileController = TextEditingController();
//El metodo signIn esta en future por que hasta cuando no le demos click no lo vamos a utilizar
  Future signIn() async {
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());

      addUserDetails(
        _firstNameController.text.trim(),
        _lastNameController.text.trim(),
        _userProfileController.text.trim(),
        _emailController.text.trim(),
      );
    }
  }
//este metodo tambien esta en future por que puede que no lo utilicemos,y cuando lo utilicemos nos guarda la informacion en los campos correspondientes
  Future addUserDetails(
    String firstName,
    String lastName,
    String userProfile,
    String email,
  ) async {
    await FirebaseFirestore.instance.collection('Cuentas').add({
      'first name': firstName,
      'last name': lastName,
      'userProfile': userProfile,
      'email': email
    });
  }
//las dos contraseñas tiene que ser iguales
  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }
//nos sirve para liberar la memoria asignada a las variables cuando se quita el objeto de estado.

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _userProfileController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    //Scaffold nos da un mejor diseño a nuestra hoja
    return Scaffold(
      //le damos un fondo gris
      backgroundColor: Colors.grey[300],
      //definimos el area que vamos a trabajar
      body: SafeArea(
        //la centramos
        child: Center(
          //le damos scroll
          child: SingleChildScrollView(
            //cremaos una columna y la centramos
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //le damos una espacio
              children: [
                const SizedBox(
                  height: 10,
                ),
                //realizamos un texto con fuente de google y tamaño 60
                Text('¡Hola Amigos!',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 60,
                    )),
                //le damos espacio
                const SizedBox(height: 20),
                const Text('Registre sus datos a continuacion',
                    style: TextStyle(
                      fontSize: 20,
                    )),
                //le damos un espacio
                const SizedBox(height: 40),
                //realizamos textfield para el primer nombre
                /*
                * estos textfield definimos lo mismo en todos solo que cambiamos el controlador para que la informacion
                se guarde en sus respectivos campos
                * es por que solo comentareo el primero
                * */
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    //controlamos donde se guardara la informacion
                    controller: _firstNameController,
                    //hacemos un campo de texto el cual tiene un borde tiene fondo blanco y cuando le damos click el borde
                    //pasa a morado y el campo dse ponde de fondo gris
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12)),
                        hintText: 'First Name',
                        fillColor: Colors.grey[200],
                        filled: true),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _lastNameController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12)),
                        hintText: 'Last Name',
                        fillColor: Colors.grey[200],
                        filled: true),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _userProfileController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12)),
                        hintText: 'User Profile',
                        fillColor: Colors.grey[200],
                        filled: true),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _emailController,
                    obscureText: false,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12)),
                        hintText: 'Email',
                        fillColor: Colors.grey[200],
                        filled: true),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: false,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12)),
                        hintText: 'Passworrd',
                        fillColor: Colors.grey[200],
                        filled: true),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'confirma password',
                        fillColor: Colors.grey[200],
                        filled: true),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  //al darle click nos guarda la informacion en el firebase
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: GestureDetector(
                    onTap: signIn,
                    //metodo que gestiona la creacion de nuevas cuentas
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(12)),
                      child: const Center(
                        child: Text(
                          'Registrarse Ahora',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Soy miembro',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //en esta parte nos devuelve al login por si ya tenemos cuenta
                    GestureDetector(
                      onTap: widget.showLoginPage,
                      child: const Text(
                        'Iniciar Secion',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
