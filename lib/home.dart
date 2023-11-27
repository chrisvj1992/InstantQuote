import 'dart:html';
import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:instant_quote/login.dart';
import 'package:instant_quote/newQuote.dart';
import 'package:instant_quote/quoteView.dart';
import 'package:instant_quote/utils/constantes.dart' as cons;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List users = [];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('Main'),
        ),
        drawer: Drawer(
          child: Container(
            color: Colors.blue,
            child: Column(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.pushReplacement(context
                            , MaterialPageRoute(
                                builder: (context) => Home()));
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 50),
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      color: Colors.grey[100],
                      child: const Text("Home"),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.pushReplacement(context
                            , MaterialPageRoute(
                                builder: (context) => newQuote()));
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 50),
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      color: Colors.grey[100],
                      child: const Text("new Quote"),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.pushReplacement(context
                            , MaterialPageRoute(
                                builder: (context) => quoteView()));
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 50),
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      color: Colors.grey[100],
                      child: const Text("quote View"),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.pushReplacement(context
                            , MaterialPageRoute(
                                builder: (context) => Login()));
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 50),
                      padding: const EdgeInsets.all(20),
                      width: double.infinity,
                      color: Colors.grey[100],
                      child: const Text("sign Out"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body:
        Stack(
          children: [
            Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Container(
                      color: Colors.green,
                      width: size.width * 0.8,
                      height: size.height * 0.75,
                        child:
                          Text('aqui va el mapa')
                        ,
                )
             ),
            )
          ],
        )
    );
  }
}
