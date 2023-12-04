// ignore_for_file: camel_case_types, file_names

// ignore: unused_import, avoid_web_libraries_in_flutter

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:instant_quote/utils/constantes.dart';
import 'package:instant_quote/utils/services/firebase_service.dart';
import 'package:firebase_storage/firebase_storage.dart';

class quoteView extends StatefulWidget {
  const quoteView({super.key});

  @override
  State<quoteView> createState() => _quoteViewState();
}

class _quoteViewState extends State<quoteView> {
  String? downloadURL;
  String? userName;
  String? quoteString;

  Future<void> downloadImage(String imageName) async {
    downloadURL = await FirebaseStorage.instance.ref().child(imageName).getDownloadURL();
    // Ahora puedes usar el enlace de descarga para mostrar la imagen en tu aplicación.
  }


  @override
  void initState() {
    super.initState();
    initData();

    Timer.periodic(Duration(milliseconds: 1), (timer) {
      setState(() {
        build(context);
      });
    });
  }

  Future<void> initData() async {
    var quote = await getQuote(idQuote);
    var quoteUser = await getQuoteUser(quote['id']);
    Map<String, dynamic> data = quote.data() as Map<String, dynamic>;
    //Map<String, dynamic> dataUser = quoteUser.data() as Map<String, dynamic>;
    //print('ESTE ES EL QUOTE' + data['quote']);
    //print(data['img']);
    //print(data['coords'].latitude);
    //print(data['coords'].longitude);
    //print('NOMBRE DEL USUARIO '+ dataUser.toString());
    //print('------------------');

    downloadURL = data['img'];
    userName = quoteUser['name'];
    quoteString = data['quote'];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if(downloadURL != null) {
      downloadImage(downloadURL!);}

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        toolbarHeight: 80,
        title: Text('Quote de: $userName'),
        titleTextStyle: const TextStyle(
            color: Colors.black45, fontSize: 24, fontWeight: FontWeight.bold),
        iconTheme: const IconThemeData(color: Colors.black45, size: 32.0),
      ),
      body: Stack(
        children: [
        Container(
          height: size.height * 0.55,
          width: size.width * 1,
          decoration: const BoxDecoration(
              color: Colors.white,
          ),
          child:
          downloadURL != null
              ? Image.network(downloadURL!,
              fit: BoxFit.cover)
              : Image.asset('assets/LogoOscuro.jpg',
              fit: BoxFit.fitWidth,
          ),
          //Container(
            //  margin: const EdgeInsets.only(top: 80),
            //  color: const Color.fromRGBO(252, 243, 207, 0.8),
            //  child: const Text('hola, soy un quote')),
          ),
          Container(
            height: size.height * 0.5,
            width: size.width * 0.85,
            margin: const EdgeInsets.only(top: 160, left: 30, right: 30),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(221, 190, 146, 0.8),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(3),
                topRight: Radius.circular(3),
                bottomLeft: Radius.circular(3),
                bottomRight: Radius.circular(
                    40), // Ajusta el valor según tu necesidad
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: SingleChildScrollView(
              child:
                Text(quoteString != null
                    ? quoteString!
                    : ''
                  , style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                  ),
                ),
            ),
          )
        ]
      ),
      backgroundColor: bgDark,
    );
  }
}
