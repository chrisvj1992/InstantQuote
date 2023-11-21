import 'package:flutter/material.dart';
import 'package:instant_quote/mapa.dart';
import 'package:instant_quote/utils/constantes.dart' as cons;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List users = [];

  @override
  void iniState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
        appBar: AppBar(),
        body:
        Stack(
            children: [
          Padding(
              padding: const EdgeInsets.all(20),
              child: Column(children: [
                  ElevatedButton(
                  onPressed: () {
                    },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white70,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          fixedSize: Size(size.width * 0.75, 45)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    )
                ,
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const mapa()));
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: cons.AzulPrimario,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      fixedSize: Size(size.width * 0.75, 45)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person,
                        color: cons.gris,
                      ),
                      Text(
                        'Vista amigos',
                        style: TextStyle(
                            color: cons.blanco,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      )
                      //Label(texto: "Ingresar")
                    ],
                  ),
                )
              ]))
        ]));
  }
}
