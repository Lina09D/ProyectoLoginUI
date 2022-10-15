//Se importa el paquete de flutter framework
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetUsername extends StatelessWidget {
  final String documentId;
  GetUsername({required this.documentId});

  @override
  Widget build(BuildContext context) {
    //Se crea un array con el primer y segundo nombre de la coleccion creada en Firebase
   CollectionReference users = FirebaseFirestore.instance.collection('Cuentas');

   return FutureBuilder<DocumentSnapshot>(
       future: users.doc(documentId).get(),
       builder: ((context,snapshot){

         if(snapshot.connectionState==ConnectionState.done){
           Map<String,dynamic> data= snapshot.data!.data() as Map<String,dynamic>;
           return Text('Nombre Usuario${data['first name']}${data['last name']}');
         }
         return const Text('cargando..');
       })
   );
  }
}
