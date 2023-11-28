// ignore_for_file: constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const AzulPrimario = Color.fromARGB(255, 38, 216, 159);
const gris = Color.fromARGB(255, 147, 147, 147);
const negro = Color.fromARGB(255, 16, 7, 42);
const blanco = Color.fromARGB(255, 255, 255, 255);
late var users;
Set<Marker> markersGlobal = {};
bool isLogged = false;
