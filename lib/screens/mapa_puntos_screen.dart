import 'package:espacios_naturales/models/espacios_naturales_models.dart';
import 'package:espacios_naturales/screens/tipo_seleccionado_screen.dart';
import 'package:espacios_naturales/widgets/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:utm/utm.dart';

import '../providers/menu_provider.dart';

class MapaPuntosScreen extends StatefulWidget {
  final EspaciosNaturales en;

  MapaPuntosScreen({@required this.en});

  @override
  _MapaPuntosScreenState createState() => _MapaPuntosScreenState(en: en);
}

class _MapaPuntosScreenState extends State<MapaPuntosScreen> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Position _currentPosition;
  EspaciosNaturales en;
  final map = new MapController();
  var latlon;

  _MapaPuntosScreenState({@required this.en}) {
    latlon = UTM.fromUtm(
      easting: double.parse(en.georrX),
      northing: double.parse(en.georrY),
      zoneNumber: 30,
      zoneLetter: "N",
    );
  }
  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    en = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Mapa"),
        actions: [
          IconButton(
              icon: Icon(Icons.gps_fixed),
              onPressed: () {
                _miPosicion();
              }),
        ],
      ),
      drawer: MenuDrawer(),
      body: _flutterMap(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Get.offAll(ListaTipoEspacioNaturalSeleccionadoScreen());
        },
      ),
    );
  }

  Widget _flutterMap() {
    return new FlutterMap(
      mapController: map,
      options: new MapOptions(
        center: new LatLng(latlon.lat, latlon.lon),
        zoom: 18.0,
      ),
      layers: [
        _mapa(),
        _markers(),
        _position(),
      ],
    );
  }

  void _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
    }).catchError((e) {
      print(e);
    });
  }

  _mapa() {
    return new TileLayerOptions(
      urlTemplate: "https://api.tiles.mapbox.com/v4/"
          "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
      additionalOptions: {
        'accessToken':
            'pk.eyJ1IjoieXVtdXIiLCJhIjoiY2tnN3Z6Nng3MDJpMjJ0bXFmOWI2b2doaiJ9.nP9f2OgapbLi8o4gfJd9Aw',
        'id': 'mapbox.satellite',
      },
    );
  }

  _markers() {
    return new MarkerLayerOptions(
      markers: [
        new Marker(
          width: 50.0,
          height: 50.0,
          point: new LatLng(latlon.lat, latlon.lon),
          builder: (ctx) => new Container(
            child: ImageIcon(AssetImage('assets/images/ubicacion.png')),
          ),
        ),
      ],
    );
  }

  _position() {
    if (_currentPosition == null) return MarkerLayerOptions();
    return new MarkerLayerOptions(
      markers: [
        new Marker(
          width: 50.0,
          height: 50.0,
          point:
              new LatLng(_currentPosition.latitude, _currentPosition.longitude),
          builder: (ctx) => new Container(
            child: Icon(
              Icons.location_on,
              size: 50.0,
            ),
          ),
        ),
      ],
    );
  }

  void _miPosicion() {
    if (_currentPosition != null) {
      map.move(
          new LatLng(_currentPosition.latitude, _currentPosition.longitude),
          16);
    }
  }
}
