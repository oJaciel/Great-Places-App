import 'dart:io';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceLocation {
  final double latitude;
  final double longitude;
  final String adress;

  const PlaceLocation(
    this.adress, {
    required this.latitude,
    required this.longitude,
  });

  LatLng toLatLng() {
    return LatLng(latitude, longitude);
  }
}

class Place {
  final String id;
  final String title;
  final PlaceLocation location;
  final File image;

  Place({
    required this.id,
    required this.title,
    required this.location,
    required this.image,
  });
}
