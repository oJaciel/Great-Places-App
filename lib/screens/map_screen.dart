import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_places/models/place.dart';

class MapScreen extends StatefulWidget {
  final PlaceLocation initialLocation;
  final bool isReadonly;

  MapScreen({
    this.initialLocation = const PlaceLocation(
      'Google Headquarters',
      latitude: 37.419857,
      longitude: -122.078827,
    ),
    this.isReadonly = false,
  });

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _pickedPosition;

  void _selectPosition(LatLng position) {
    setState(() {
      _pickedPosition = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecione'),
        actions: [
          if (!widget.isReadonly)
            IconButton(
              onPressed:
                  _pickedPosition == null
                      ? null
                      : () {
                        Navigator.of(context).pop(_pickedPosition);
                      },
              icon: Icon(Icons.check),
            ),
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.initialLocation.latitude,
            widget.initialLocation.longitude,
          ),
          zoom: 13,
        ),
        onTap: widget.isReadonly ? null : _selectPosition,
        markers:
            _pickedPosition == null && !widget.isReadonly
                ? {}
                : {
                  Marker(markerId: MarkerId('p1'), position: _pickedPosition ?? widget.initialLocation.toLatLng()),
                },
      ),
    );
  }
}
