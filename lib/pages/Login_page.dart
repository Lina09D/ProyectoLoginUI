//Se importa el paquete de flutter framework
import 'package:flutter/material.dart';
//Importamos el firebase para autenticar
import 'package:firebase_auth/firebase_auth.dart';


import 'ForgotPasswordPage.dart';
//Este Widget nos permite lectura y escritura
class Loginpage extends StatefulWidget {
  //Se crea variable para mostrar el registo
  final VoidCallback showRegisterPage;

  const Loginpage({Key? key, required this.showRegisterPage}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  //Se crean dos variables que definen los controladores del email y passaword
  final _emailController = TextEditingController();
  final _passawordController = TextEditingController();
//Creamos un metodo futuro
  Future signIn() async {
    //Esperamos la respuesta del registro
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      //el punto trim nos sirve texto contiene espacios en blanco iniciales o finales, se devuelve una nueva cadena sin iniciales ni espacios en blanco
        email: _emailController.text.trim(),
        password: _passawordController.text.trim());
  }
//nos sirve para liberar la memoria asignada a las variables cuando se quita el objeto de estado.
  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    //Scaffold nos sirve para darle un mejor diseño a la hoja
    return Scaffold(
      //le damos un fondo gris
      backgroundColor: Colors.grey[300],
      //SafeArea nos sirve para definir que parte vamos a trabajar
      body: SafeArea(
        //Centramos todo
        child: Center(
          //Colocamos scroll
          child: SingleChildScrollView(
            //creamos una columna que va a estar centrada
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //Colocamos un icono con un tamaño de 100px
              children: [
                const Icon(
                  Icons.adb,
                  size: 100,
                ),
                //Colocamos un texto const nos sirve para definir un texto que no va cambiar,le damos un tamaño y negrita
                const Text('¡Hola Amigos!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    )),
                //se define como un cuadro con un tamaño especificado
                const SizedBox(height: 10),
                //Colocamos un texto const nos sirve para definir un texto que no va cambiar,le damos un tamaño y negrita

                const Text('Bienvenido de nuevo,lo hemos extrañado',
                    style: TextStyle(
                      fontSize: 20,
                    )),
                //se define como un cuadro con un tamaño especificado
                const SizedBox(height: 20),
                //le damos un padding horizontal
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  //Creamos una caja de texto
                  child: TextField(
                    //controla el email
                    controller: _emailController,
                    //Colocamos false para que nos deje ver el correo
                    obscureText: false,
                    //decoramos nuestro campo ledamos un borde de color blanco y con un radio de 12
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)),
                        //caundo le damos click al ingresar el email se pone un borde morado con el fondo gris
                        focusedBorder: OutlineInputBorder(

                            borderSide:
                                const BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12)),
                        hintText: 'Email',
                        fillColor: Colors.grey[200],
                        filled: true),
                  ),
                ),
                //se define como un cuadro con un tamaño especificado
                const SizedBox(height: 20),
                //le damos un padding horizontal
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  //Creamos una caja de texto
                  child: TextField(
                    //controla el email
                    controller: _passawordController,
                    //Colocamos true para no ver la contraseña
                    obscureText: true,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)),
                        //caundo le damos click al ingresar el email se pone un borde morado con el fondo gris

                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12)),
                        hintText: 'Passworrd',
                        fillColor: Colors.grey[200],
                        filled: true),
                  ),
                ),
                //se define como un cuadro con un tamaño especificado
                const SizedBox(
                  width: 20,
                ),
                //le damos un padding horizontal
                Padding(
                  //le damos un padding horizontal
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  //creamos una fila
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          //navigator nos enviaaotra hoja al darle click
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const ForgotPasswordPage();
                          }));
                        },
                        //colocamos el texto y le damos un color y negrita
                        child: const Text('¿Olvido la contraseña?',style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold
                        ),),

                      )
                    ],
                  ),
                ),
                //le damos un padding horizontal
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  //en esta parte hacemos signIn el cual al darle click a ese texto esperamos la respuesta del fire base para comprobar el el correo y la contraseña estan guardadas
                  child: GestureDetector(
                    onTap: signIn,
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          'Iniciar sesion',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
                //se define como un cuadro con un tamaño especificado
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      '¿No tiene cuenta?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //En esta parte lo uqe ahcemos es que cuando le damos click a registrese ahora nos envia a otra hoja para registrarse ,al texto le damos un color y negrita
                    GestureDetector(
                      onTap: widget.showRegisterPage,
                      child: const Text('¡Registrese Ahora!',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold)),
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
