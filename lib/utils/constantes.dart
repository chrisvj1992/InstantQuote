// ignore_for_file: constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const AzulPrimario = Color.fromARGB(255, 38, 216, 159);
const gris = Color.fromARGB(255, 147, 147, 147);
const negro = Color.fromARGB(255, 16, 7, 42);
const blanco = Color.fromARGB(255, 255, 255, 255);
const bgDark = Color.fromRGBO(33, 43, 49, 1.0);
const bgLight = Color.fromARGB(255, 255, 255, 255);
var bg = bgDark;
late var users;
Set<Marker> markersGlobal = {};
bool isLogged = false;
double lati = 0;
double longi = 0;
String idUser = '';
String idQuote = '';
