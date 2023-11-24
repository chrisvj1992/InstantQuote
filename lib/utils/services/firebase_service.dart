import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getData() async {
  List users = [];
  CollectionReference collectionReferencePeople = db.collection('users');
  QuerySnapshot queryPeople = await collectionReferencePeople.get();
  // ignore: avoid_function_literals_in_foreach_calls
  queryPeople.docs.forEach((documento) {
    users.add(documento.data());
  });
  return users;
}

Future<void> addUser(String email, String pass) async {
  await db.collection("users").add({"email": email, "pass": pass});
}

// Future<void> editPeople(String name, String newName) async {
//   final CollectionReference collectionReferencePeople = db.collection('name');

//   final QuerySnapshot queryPeople =
//       await collectionReferencePeople.where('nombre', isEqualTo: name).get();

//   if (queryPeople.docs.isNotEmpty) {
//     final DocumentReference documentReference =
//         queryPeople.docs.first.reference;
//     await documentReference.update({'nombre': newName});
//     print('Registro actualizado exitosamente');
//   } else {
//     print('Registro no encontrado');
//   }
// }

// Future<void> deletePeople(String name) async {
//   final CollectionReference collectionReferencePeople = db.collection('name');

//   // Busca documentos que coincidan con el nombre proporcionado.
//   final QuerySnapshot queryPeople =
//       await collectionReferencePeople.where('nombre', isEqualTo: name).get();

//   if (queryPeople.docs.isNotEmpty) {
//     // Si se encontraron documentos con el nombre, elimina cada uno de ellos.
//     for (final QueryDocumentSnapshot document in queryPeople.docs) {
//       await document.reference.delete();
//       print('Registro eliminado exitosamente');
//     }
//   } else {
//     print('Registro no encontrado');
//   }
// }
