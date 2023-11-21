import 'package:flutter/material.dart';
import 'package:instant_quote/utils/constantes.dart' as cons;

// ignore: camel_case_types
class mapa extends StatefulWidget {
  const mapa({super.key});

  @override
  State<mapa> createState() => _mapaState();
}

// ignore: camel_case_types
class _mapaState extends State<mapa> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          const Text('Vista del mapa'),
          Expanded(
            child: Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: cons.AzulPrimario,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    fixedSize: Size(size.width * 0.75, 45)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
