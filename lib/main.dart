import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'dart:ui_web' as ui;
import 'dart:html'; // Import for DivElement and other HTML elements

void main() {
  ui.platformViewRegistry.registerViewFactory(
    'mapbox-gl',
    (int viewId) => DivElement(),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Mapbox3DMapScreen(),
    );
  }
}

class Mapbox3DMapScreen extends StatefulWidget {
  @override
  _Mapbox3DMapScreenState createState() => _Mapbox3DMapScreenState();
}

class _Mapbox3DMapScreenState extends State<Mapbox3DMapScreen> {
  MapboxMapController? mapController;

  // Replace with your Mapbox access token
  final String accessToken =
      'pk.eyJ1IjoibW9oYW1lZG51bWFpcjIwMjQiLCJhIjoiY202N245a3VlMDU1aTJrcXJkeXl2eHkzMSJ9.fDBWiIJQQNHqJoZWpOfvNA';

  // Replace with your custom 3D-enabled style URL
  final String mapStyle =
      'mapbox://styles/mohamednumair2024/cm02zxc1t007t01r6eomnhhdf';

  // Initial camera position
  final CameraPosition _initialCameraPosition = const CameraPosition(
    target: LatLng(37.7749, -122.4194), // San Francisco coordinates
    zoom: 12,
    bearing: 1,
    tilt: 45, // Tilt for 3D perspective
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('3D Mapbox in Flutter Web'),
      ),
      body: MapboxMap(
        accessToken: accessToken,
        styleString: mapStyle,
        initialCameraPosition: _initialCameraPosition,
        onMapCreated: (controller) {
          setState(() {
            mapController = controller;
          });
        },
        minMaxZoomPreference: const MinMaxZoomPreference(0, 22),
        compassEnabled: true,
        rotateGesturesEnabled: true,
        scrollGesturesEnabled: true,
        tiltGesturesEnabled: true,
        zoomGesturesEnabled: true,
      ),
    );
  }
}
