// ignore_for_file: avoid_print

import 'dart:core';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:instant_quote/newQuote.dart';
import 'package:instant_quote/quoteView.dart';
import 'package:instant_quote/utils/constantes.dart';
import 'package:instant_quote/utils/services/firebase_service.dart';
import 'package:permission_handler/permission_handler.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(22.144596, -101.009064);

  @override
  void initState() {
    super.initState();
    initData();
  }

  Future<void> initData() async {
    users = await getData();
    List<Marker> markerss = await getCoords(context);
    setState(() {
      markersGlobal = markerss.toSet();
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color.fromRGBO(33, 43, 49, 1.0),
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          toolbarHeight: 80,
          title: const Text('Inicio'),
          titleTextStyle: TextStyle(
              color: Colors.black45,
              fontSize: 24,
              fontWeight: FontWeight.bold
          ),
          iconTheme: IconThemeData(color: Colors.black45, size: 32.0),
        ),
        body: Stack(children: [

          Container(
            padding: EdgeInsets.only(bottom: size.height * 0.1),
            width: size.width,
            height: size.height ,
            child: Stack(
              children: [
                GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(target: _center, zoom: 17),
                  markers: markersGlobal,

                ),
                Column(
                  children: [
                    const SizedBox(height: 80),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            _myPosition();
                          });
                        },
                        backgroundColor: Colors.greenAccent,
                        child: const Icon(Icons.location_searching_rounded),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const newQuote()));
                          });
                        },
                        backgroundColor: Colors.greenAccent,
                        child: const Icon(Icons.add_a_photo_outlined),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const newQuote()));
                          });
                        },
                        backgroundColor: Colors.greenAccent,
                        child: const Icon(Icons.supervised_user_circle_sharp),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ]));
  }

  Future<void> _myPosition() async {
    PermissionStatus permissionStatus = await Permission.location.request();

    if (permissionStatus.isGranted) {
      try {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best);

        double lat = position.latitude;
        double long = position.longitude;

        print(lat);
        print(long);
        print('-------');

        mapController
            .animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, long), 16));
      } catch (e) {
        print('Error de ubicación: $e');
      }
    }
  }
}
