import 'dart:convert';
import 'package:espacios_naturales/models/espacios_naturales_models.dart';
import 'package:espacios_naturales/models/espacios_puntos_models.dart';
import 'package:flutter/services.dart' show rootBundle;

class MenuProvider {
  List<String> listaAreas = [];
  List<String> listaTipos = [];
  List<EspaciosNaturales> listaTipoSeleccionado = [];

  List<EspaciosNaturales> listaPuntos = [];

  Future<List<EspaciosNaturales>> cargarPuntos() async {
    final data = await rootBundle
        .loadString('assets/data/Opendata_Resultados_PN_es.json');
    final decodedData = json.decode(data);
    final openData = decodedData['OpenData'];
    final openDataRow = openData['OpenDataRow'];
    Espacios puntos = Espacios.fromJsonList(openDataRow);
    listaPuntos = puntos.lista;
    return listaPuntos;
  }

  Future<List<String>> cargarZonas() async {
    if (listaPuntos.length == 0) {
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

  Future<List<String>> cargarTipos(String zona) async {
    if (listaPuntos.length == 0) {
      await cargarPuntos();
    }
    listaTipos = [];
    listaPuntos.forEach((pr) {
      if ((zona == pr.descripZona) &&
          (listaTipos.indexOf(pr.tipo) < 0) &&
          pr.tipo != "") {
        listaTipos.add(pr.tipo);
      }
    });
    return listaTipos;
  }

  Future<List<EspaciosNaturales>> cargarTipoSeleccionado(String tipo) async {
    if (listaPuntos.length == 0) {
      await cargarPuntos();
    }
    listaTipoSeleccionado = [];
    listaPuntos.forEach((pr) {
      if ((tipo == pr.tipo) &&
          (listaTipoSeleccionado.indexOf(pr) < 0) &&
          pr.nombre != "") {
        listaTipoSeleccionado.add(pr);
      }
    });
    return listaTipoSeleccionado;
  }
}

final menuProvider = new MenuProvider();
