// ignore_for_file: camel_case_types, file_names

// ignore: unused_import, avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class quoteView extends StatefulWidget {
  final String quote;
  final Reference imageReference;
  const  quoteView({
    Key? key,
    required this.quote,
    required this.imageReference,
}) : super(key: key);

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
              child: Text('Quote: ${widget.quote}'),
          ),
        ),
      ),
      backgroundColor: Colors.black87,
    );
  }
}
