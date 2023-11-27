import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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
  bool _validateTime = false;
  bool _validateLatitude = false;
  bool _validateLongitud = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('nuevo Quote'),
      ),

      body:
      Column(
        children: [
          Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.sticky_note_2_outlined,
                  color: Colors.black,
                ),
                Expanded(
                    child: TextFormField(
                      controller: quote,
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            width: 1,
                            style: BorderStyle.none,
                          ),
                        ),
                        hintText: 'Quote',
                        filled: true,
                        fillColor: Colors.grey,
                        errorText: _validateQuote ? 'Debe escribir un Quote' : null,
                        contentPadding: const EdgeInsets.all(10),
                      ),
                      onChanged: (dato){
                        setState(() {
                          if (dato.trim().isNotEmpty){
                            _validateQuote = false;
                          }
                        });
                      },
                    )),

              ],
            ),
          ),
          ElevatedButton(
            onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Submit'),
                  content: const Text(
                      '¿Deseas subir este Quote?'
                  ),
                  actions: <Widget>[
                    TextButton(onPressed: () =>
                        Navigator.pop(context, 'Cancelar'),
                        child: const Text('Cancelar')),
                    TextButton(onPressed: () =>
                        Navigator.pop(context, 'Ok'),
                        child: const Text('Ok'))
                  ],
                )),
            child: Text('Submit'),
          )
        ],
      )
      ,
    );
  }
}
