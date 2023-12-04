// ignore_for_file: camel_case_types, file_names

import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:instant_quote/home.dart';
import 'package:instant_quote/utils/constantes.dart' as cons;
import 'package:file_picker/file_picker.dart';
import 'package:instant_quote/utils/constantes.dart';
import 'package:instant_quote/utils/services/firebase_service.dart';

class newQuote extends StatefulWidget {
  const newQuote({super.key});

  @override
  State<newQuote> createState() => _newQuoteState();
}

class _newQuoteState extends State<newQuote> {
  PlatformFile? pickedFile;
  UploadTask? uploadTask;

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });
  }

  Future uploadFile() async {
    final path = 'files/${pickedFile!.name}';
    final file = File(pickedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    uploadTask = ref.putFile(file);
    final snapshot = await uploadTask!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    addQuote(lati, longi, quote.text, path, idUser);
    //print('Link Descarga: $urlDownload');

    print("este es el FILE: $file");
  }

  final quote = TextEditingController();
  final time = TextEditingController();
  final latitude = TextEditingController();
  final longitud = TextEditingController();

  bool _validateQuote = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: bgDark,
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          toolbarHeight: 80,
          title: const Text('nuevo Quote'),
          titleTextStyle: const TextStyle(
              color: Colors.black45, fontSize: 24, fontWeight: FontWeight.bold),
          iconTheme: const IconThemeData(color: Colors.black45, size: 32.0),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const Label(
                      texto: "toca la Imagen:",
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.image,
                          color: bgLight,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectFile();
                            });
                          },
                          child: Expanded(
                            child: Container(
                              height: size.height * 0.25,
                              width: size.width * 0.78,
                              decoration:
                                  const BoxDecoration(color: Colors.white),
                              child: pickedFile != null
                                  ? Image.file(
                                      File(pickedFile!.path!),
                                      fit: BoxFit.cover,
                                    )
                                  : Image.asset('assets/LogoOscuro.jpg',
                                      fit: BoxFit.cover),
                            ),
                          ),
                        ),
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
                          child: TextFormField(
                            clipBehavior: Clip.hardEdge,
                            maxLines: 6,
                            maxLength: 120,
                            controller: quote,
                            obscureText: false,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(3),
                                  topRight: Radius.circular(3),
                                  bottomLeft: Radius.circular(3),
                                  bottomRight: Radius.circular(
                                      40), // Ajusta esta esquina para ocultarla
                                ),
                                borderSide: BorderSide(
                                  width: 1,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              hintText:
                                  '____________________________________________________________________________________________________________________________________________________',
                              hintFadeDuration: const Duration(hours: 2),
                              filled: true,
                              fillColor:
                                  const Color.fromRGBO(221, 190, 146, 1.0),
                              errorText: _validateQuote
                                  ? 'Debe escribir un Quote'
                                  : null,
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
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancelar'),
                                child: const Text('Cancelar')),
                            TextButton(
                                onPressed: () => {
                                      uploadFile(),
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const Home()),
                                      )
                                    },
                                child: const Text('Ok'))
                          ],
                        )),
                style: ElevatedButton.styleFrom(
                  backgroundColor: cons.AzulPrimario,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  fixedSize: Size(size.width * 0.45, 45),
                  // Agrega la propiedad boxShadow para el efecto de sombreado
                  elevation: 20,
                  shadowColor: const Color.fromRGBO(158, 255, 212, 1.0),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    color: Color.fromRGBO(158, 255, 212, 1.0),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ));
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
