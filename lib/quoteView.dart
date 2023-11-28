// ignore_for_file: camel_case_types, file_names

// ignore: unused_import, avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';

class quoteView extends StatefulWidget {
  const quoteView({super.key});

  @override
  State<quoteView> createState() => _quoteViewState();
}

class _quoteViewState extends State<quoteView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('quote View'),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 80),
          height: size.height * 0.4,
          width: size.width * 0.8,
          decoration: const BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                image: AssetImage('assets/fotoDemo.jpeg'),
                fit: BoxFit.cover,
              )),
          child: Container(
              margin: const EdgeInsets.only(top: 80),
              color: const Color.fromRGBO(252, 243, 207, 0.8),
              child: const Text('hola, soy un quote')),
        ),
      ),
      backgroundColor: Colors.black87,
    );
  }
}
