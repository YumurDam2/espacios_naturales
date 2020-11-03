import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider{
  List<dynamic> opciones = [];

  _MenuProvider() {
    cargarZona();
  }

  Future<List<dynamic>> cargarZona() async {
    final resp = await rootBundle.loadString('data/Opendata_Resultados_PN_es.json');
    Map dataMap = json.decode( resp );
    opciones = dataMap['DescripZona'];
    return opciones;
  }
}

final menuProvider = new _MenuProvider();