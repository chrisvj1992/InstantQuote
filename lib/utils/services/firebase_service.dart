import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:instant_quote/quoteView.dart';
import 'package:instant_quote/utils/constantes.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getData() async {
  List users = [];
  CollectionReference collectionReferencePeople = db.collection('users');
  QuerySnapshot queryPeople = await collectionReferencePeople.get();
  for (var documento in queryPeople.docs) {
    users.add(documento.data());
  }
  return users;
}

Future getQuote(String id) async {
  CollectionReference collectionReferenceQuote = db.collection('coords');
  DocumentSnapshot<Object?> queryCoords =
      await collectionReferenceQuote.doc(id).get();
  // DocumentSnapshot document = await db.collection('tuColeccion').doc(id).get();
  return queryCoords;
}

Future getQuoteUser(String id) async {
  CollectionReference collectionReferenceUser = db.collection('users');
  DocumentSnapshot<Object?> queryUser =
      await collectionReferenceUser.doc(id).get();
  return queryUser;
}

Future<List<Marker>> getCoords(BuildContext context) async {
  List<Marker> coords = [];
  CollectionReference collectionReference = db.collection('coords');
  QuerySnapshot queryCoords = await collectionReference.get();
  for (var documento in queryCoords.docs) {
    coords.add(Marker(
        markerId: MarkerId(documento.id),
        position:
            LatLng(documento['coords'].latitude, documento['coords'].longitude),
        onTap: () {
          navigateToQuoteView(context, documento.id);
        }));
  }
  return coords;
}

void navigateToQuoteView(BuildContext context, id) {
  idQuote = id;
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const quoteView()),
  );
}

Future<void> addQuote(
    double lat, double long, String quote, String imgPath, String id) async {
  GeoPoint coords = GeoPoint(lat, long);
  await db
      .collection("coords")
      .add({'coords': coords, 'id': id, 'img': imgPath, 'quote': quote});
}

Future<void> addUser(String email, String pass) async {
  await db.collection("users").add({"email": email, "pass": pass});
}

Future<bool> autenticarUsuario(String email, String pass) async {
  try {
    QuerySnapshot querySnapshot =
        await db.collection('users').where('email', isEqualTo: email).get();
    if (querySnapshot.docs.isNotEmpty) {
      Object? userData = querySnapshot.docs[0].data();
      var datos = userData
          .toString()
          .replaceAll('{', '')
          .replaceAll('}', '')
          .split(', ');
      var oriEmail = datos[3].split(': ');
      var oriPass = datos[0].split(': ');
      if (oriEmail[1] == email && oriPass[1] == pass) {
        isLogged = true;
        idUser = querySnapshot.docs.first.id;
        return true;
      }
    }
    isLogged = false;
    return false;
  } catch (e) {
    return false;
  }
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
