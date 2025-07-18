import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_places/screens/map_screen.dart';
import 'package:great_places/utils/location_util.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  const LocationInput(this.onSelectPosition, {super.key});

  final Function onSelectPosition;

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;
  bool _isLoading = false;

  void _showPreview(double lat, double lng) {
    final staticMapImageUrl = LocationUtil.generateLocationPreviewImage(
      latitude: lat,
      longitude: lng,
    );

    setState(() {
      _previewImageUrl = staticMapImageUrl;
    });
  }

  Future<void> _getCurrentUserLocation() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final locData = await Location().getLocation();

      _showPreview(locData.latitude!, locData.longitude!);

      widget.onSelectPosition(LatLng(locData.latitude!, locData.longitude!));
    } catch (e) {
      return;
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _selectOnMap() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final LatLng selectedPosition = await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => MapScreen(),
          fullscreenDialog: true,
        ),
      );

      _showPreview(selectedPosition.latitude, selectedPosition.longitude);

      widget.onSelectPosition(selectedPosition);
    } catch (e) {
      return;
    } finally {
      _isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child:
              _isLoading == true
                  ? CircularProgressIndicator()
                  : _previewImageUrl == null
                  ? Text('Localização  não informada')
                  : Image.network(
                    _previewImageUrl!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              onPressed: _getCurrentUserLocation,
              label: Text(
                'Localização Atual',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              icon: Icon(Icons.location_on),
            ),
            TextButton.icon(
              onPressed: _selectOnMap,
              label: Text(
                'Selecione no Mapa',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              icon: Icon(Icons.map),
            ),
          ],
        ),
      ],
    );
  }
}
