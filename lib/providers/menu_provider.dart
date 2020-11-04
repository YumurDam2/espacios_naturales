import 'dart:convert';
import 'package:espacios_naturales/models/espacios_naturales_models.dart';
import 'package:espacios_naturales/models/espacios_puntos_models.dart';
import 'package:flutter/services.dart' show rootBundle;

class MenuProvider{
  List<String> listaAreas = [];
  List<EspaciosNaturales> listaPuntos = [];

  

  Future<List<EspaciosNaturales>> cargarPuntos() async {
    final data =
        await rootBundle.loadString('assets/data/Opendata_Resultados_PN_es.json');
    final decodedData = json.decode(data);
    final openData = decodedData['OpenData'];
    final openDataRow = openData['OpenDataRow'];
    Espacios puntos = Espacios.fromJsonList(openDataRow);
    listaPuntos = puntos.lista;
    return listaPuntos;
  }

  // Future<List<dynamic>> cargarZona() async {
  //   final resp = await rootBundle.loadString('assets/data/Opendata_Resultados_PN_es.json');
  //   Map dataMap = json.decode( resp );
  //   listaAreas = dataMap['DescripZona'];
  //   return listaAreas;
  // }
   Future<List<String>> cargarZonas() async {
    if (listaPuntos.length == 0)  {
      await cargarPuntos();
    }
    listaAreas = [];
    listaPuntos.forEach((pr) {
      if ((listaAreas.indexOf(pr.descripZona) < 0) && pr.descripZona != "") {
        listaAreas.add(pr.descripZona);
      }
    });
    return listaAreas;
  }
}

final menuProvider = new MenuProvider();