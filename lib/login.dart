import 'package:flutter/material.dart';
import 'package:instant_quote/home.dart';
import 'package:instant_quote/utils/constantes.dart' as cons;

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
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.all(size.width * 0.05),
            child: Column(
              children: [
                Container(
                  height: size.height * 0.3,
                  width: size.width * 0.6,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('LogoOscuro.jpg'),
                          fit: BoxFit.cover)),
                ),
                const SizedBox(
                  height: 15,
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
                  height: 25,
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _validatePass = pass.text.isEmpty ? true : false;
                        _validateMail = email.text.isEmpty ? true : false;

                        if (!_validateMail && !_validatePass) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Home()));
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: cons.AzulPrimario,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        fixedSize: Size(size.width * 0.45, 45)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.login,
                          color: Colors.blueGrey,
                        ),
                        Text(
                          '  Ingresar',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )
                        //Label(texto: "Ingresar")
                      ],
                    ))
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
