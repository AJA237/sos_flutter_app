import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map {}

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition initialPosition =
      CameraPosition(target: LatLng(0.000, 0.000), zoom: 14.0);

  static const CameraPosition targetPosition = CameraPosition(
      target: LatLng(33.1546, -135.15468),
      zoom: 14.0,
      bearing: 192.0,
      tilt: 60);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            goToPosition();
          },
          label: const Text('Go To'),
          icon: const Icon(Icons.directions_boat)),
      body: SafeArea(
          child: Column(
        children: [
          const SliverAppBar(
            floating: true,
            title: Text('Map'),
            centerTitle: true,
          ),
          GoogleMap(
            initialCameraPosition: initialPosition,
            mapType: MapType.normal,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          )
        ],
      )),
    );
  }

  Future<void> goToPosition() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(targetPosition));
  }
}
