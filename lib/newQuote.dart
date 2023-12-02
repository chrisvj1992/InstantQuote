// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:instant_quote/utils/constantes.dart' as cons;

class newQuote extends StatefulWidget {
  const newQuote({super.key});

  @override
  State<newQuote> createState() => _newQuoteState();
}

class _newQuoteState extends State<newQuote> {
  final quote = TextEditingController();
  final time = TextEditingController();
  final latitude = TextEditingController();
  final longitud = TextEditingController();

  bool _validateQuote = false;
  final bool _validateTime = false;
  final bool _validateLatitude = false;
  final bool _validateLongitud = false;
  bool setImage = false;

  bool mostrarLogoOscuro = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Color.fromRGBO(33, 43, 49, 1.0),
        appBar:
        AppBar(
          backgroundColor: Colors.greenAccent,
          toolbarHeight: 80,
          title: const Text('nuevo Quote'),
          titleTextStyle: TextStyle(
              color: Colors.black45,
              fontSize: 24,
              fontWeight: FontWeight.bold
          ),
          iconTheme: IconThemeData(color: Colors.black45, size: 32.0),
        ),
        body:
        SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child:
                Column(
                  children: [
                    const Label(
                      texto: "toca la Imagen:",
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.image,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              mostrarLogoOscuro = !mostrarLogoOscuro;
                            });
                          },
                          child: Expanded(
                            child: Container(
                              height: size.height * 0.25,
                              width: size.width * 0.78,
                              decoration: const BoxDecoration(
                                  color: Colors.white
                              ),
                              child: Image.asset(
                                mostrarLogoOscuro
                                    ? 'assets/LogoOscuro.jpg'
                                    : 'assets/LogoClaro.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )
                        ,

                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.sticky_note_2_outlined,
                          color: Colors.white,

                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            child: TextFormField(
                              clipBehavior: Clip.hardEdge,
                              maxLines: 6,
                              maxLength: 120,
                              controller: quote,
                              obscureText: false,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(3),
                                    topRight: Radius.circular(3),
                                    bottomLeft: Radius.circular(3),
                                    bottomRight: Radius.circular(40), // Ajusta esta esquina para ocultarla
                                  ),
                                  borderSide: const BorderSide(
                                    width: 1,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                hintText: '____________________________________________________________________________________________________________________________________________________',
                                hintFadeDuration: Duration(hours: 2),
                                filled: true,
                                fillColor: Color.fromRGBO(221, 190, 146, 1.0),
                                errorText: _validateQuote ? 'Debe escribir un Quote' : null,
                                contentPadding: const EdgeInsets.all(10),

                              ),
                              onChanged: (dato) {
                                setState(() {
                                  if (dato.trim().isNotEmpty) {
                                    _validateQuote = false;
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Submit'),
                      content: const Text('¿Deseas subir este Quote?'),
                      actions: <Widget>[
                        TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancelar'),
                            child: const Text('Cancelar')),
                        TextButton(
                            onPressed: () => Navigator.pop(context, 'Ok'),
                            child: const Text('Ok'))
                      ],
                    )),
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    color: Color.fromRGBO(158, 255, 212, 1.0),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: cons.AzulPrimario,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  fixedSize: Size( size.width * 0.45, 45),
                  // Agrega la propiedad boxShadow para el efecto de sombreado
                  elevation: 20,
                  shadowColor: Color.fromRGBO(158, 255, 212, 1.0),
                ),
              )
            ],
          ),
        )
    );
  }
}


class Label extends StatelessWidget {
  final String texto;
  const Label({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 35, bottom: 10),
          child: Text(
            texto,
            style: const TextStyle(
                color: Colors.greenAccent,
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),

        )
      ],
    );
  }
}