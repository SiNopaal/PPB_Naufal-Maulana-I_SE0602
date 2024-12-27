import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:place_picker_google/place_picker_google.dart';

class MyMaps extends StatefulWidget {
  @override
  _MyMapsState createState() => _MyMapsState();
}

class _MyMapsState extends State<MyMaps> {
  static final LatLng _kMapCenter = LatLng(-7.431391, 109.247833);
  static final CameraPosition _kInitialPosition = CameraPosition(
    target: _kMapCenter,
    zoom: 11.0,
  );
  GoogleMapController? _mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps Demo'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _kInitialPosition,
            myLocationEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              _mapController = controller; 
            },
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlacePicker(
                      apiKey: 'AIzaSyBlXqXM8m1f5CGck5O85Z1LTt91YUUyf5I', 
                      initialLocation: _kMapCenter,
                    ),
                  ),
                );

                if (result != null) {
                  print('Selected Place: ${result.formattedAddress}');

                }
              },
              child: Text("Pick a Place"),
            ),
          ),
        ],
      ),
    );
  }
}
