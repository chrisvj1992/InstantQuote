// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:instant_quote/mapa.dart';
import 'package:instant_quote/utils/constantes.dart' as cons;
import 'package:permission_handler/permission_handler.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List users = [];
  final List<Marker> _markers = <Marker>[];
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(22.144596, -101.009064);

  @override
  void initState() {
    super.initState();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        //backgroundColor: Colors.black,
        appBar: AppBar(),
        body: Stack(children: [
          GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(target: _center, zoom: 17)),
          Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const mapa()));
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
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      _myPosition();
                    });
                  },
                  backgroundColor: Colors.orange,
                  child: const Icon(Icons.location_searching_rounded),
                ),
              )
            ],
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
