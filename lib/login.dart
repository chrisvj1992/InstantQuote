import 'package:flutter/material.dart';
import 'package:instant_quote/home.dart';
import 'package:instant_quote/utils/constantes.dart' as cons;
import 'package:instant_quote/utils/services/firebase_service.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController pass = TextEditingController();
  TextEditingController email = TextEditingController();

  bool _validatePass = false;
  bool _validateMail = false;


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.all(size.width * 0.1),
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                Container(
                  height: size.height * 0.25,
                  width: size.width * 0.8,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/LogoOscuro.jpg'),
                          fit: BoxFit.cover),
                    color: Colors.white
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Label(
                  texto: "correo:",
                ),
                TextFormField(
                  controller: email,
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Ingresa tu correo',
                    prefixIcon: const Icon(Icons.mail, color: Colors.white),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                            width: 1, style: BorderStyle.none)),
                    filled: true,
                    errorText:
                        _validateMail ? 'Debe de escribir su correo' : null,
                    fillColor: Colors.white70.withOpacity(0.3),
                    contentPadding: const EdgeInsets.all(10),
                  ),
                  onChanged: (dato) {
                    setState(() {
                      if (dato.trim().isNotEmpty) {
                        _validateMail = false;
                      }
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                const Label(
                  texto: "contraseña:",
                ),
                TextFormField(
                  controller: pass,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Ingresa tu contraseña',
                    prefixIcon: const Icon(Icons.password, color: Colors.white),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                            width: 1, style: BorderStyle.none)),
                    filled: true,
                    errorText:
                        _validatePass ? 'Debe de escribir su password' : null,
                    fillColor: Colors.white70.withOpacity(0.3),
                    contentPadding: const EdgeInsets.all(10),
                  ),
                  onChanged: (dato) {
                    setState(() {
                      if (dato.trim().isNotEmpty) {
                        _validatePass = false;
                      }
                    });
                  },
                ),
                const SizedBox(
                  height: 35,
                ),
                ElevatedButton(
                  onPressed: () async {
                    _validatePass = pass.text.isEmpty ? true : false;
                    _validateMail = email.text.isEmpty ? true : false;

                    if (!_validateMail && !_validatePass) {
                      if (await autenticarUsuario(email.text, pass.text) == true) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Home()),
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Credenciales incorrectas'),
                              content: const Text('Hubo un error con las credenciales'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Aceptar'),
                                )
                              ],
                            );
                          },
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: cons.AzulPrimario,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    fixedSize: Size(size.width * 0.45, 45),
                    // Agrega la propiedad boxShadow para el efecto de sombreado
                    elevation: 20,
                    shadowColor: Color.fromRGBO(158, 255, 212, 1.0),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.login,
                        color: Colors.blueGrey,
                      ),
                      const Text(
                        '  Ingresar',
                        style: TextStyle(
                          color: Color.fromRGBO(158, 255, 212, 1.0),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )

              ],
            ),
          )
        ],
      ),
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
          padding: const EdgeInsets.only(left: 10),
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
