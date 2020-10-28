// To parse this JSON data, do
//
//     final espaciosNaturales = espaciosNaturalesFromJson(jsonString);

import 'dart:convert';

EspaciosNaturales espaciosNaturalesFromJson(String str) =>
    EspaciosNaturales.fromJson(json.decode(str));

String espaciosNaturalesToJson(EspaciosNaturales data) =>
    json.encode(data.toJson());

class EspaciosNaturales {
  EspaciosNaturales({
    this.codrecurso,
    this.urlNombreCast,
    this.nombre,
    this.urlNombreBuscador,
    this.codCategoria,
    this.idRecursoCategoria,
    this.idcategoria,
    this.tipo,
    this.nombreLocalidad,
    this.descripZona,
    this.path,
    this.imgFichero,
    this.distancia,
    this.georrX,
    this.georrY,
    this.diplomacompromiso,
  });

  String codrecurso;
  String urlNombreCast;
  String nombre;
  String urlNombreBuscador;
  String codCategoria;
  String idRecursoCategoria;
  String idcategoria;
  String tipo;
  String nombreLocalidad;
  String descripZona;
  String path;
  String imgFichero;
  String distancia;
  String georrX;
  String georrY;
  String diplomacompromiso;

  factory EspaciosNaturales.fromJson(Map<String, dynamic> json) =>
      EspaciosNaturales(
        codrecurso: json["Codrecurso"],
        urlNombreCast: json["URLNombreCast"],
        nombre: json["Nombre"],
        urlNombreBuscador: json["URLNombreBuscador"],
        codCategoria: json["CodCategoria"],
        idRecursoCategoria: json["IdRecursoCategoria"],
        idcategoria: json["IDCATEGORIA"],
        tipo: json["TIPO"],
        nombreLocalidad: json["NombreLocalidad"],
        descripZona: json["DescripZona"],
        path: json["Path"],
        imgFichero: json["ImgFichero"],
        distancia: json["Distancia"],
        georrX: json["GEORR_X"],
        georrY: json["GEORR_Y"],
        diplomacompromiso: json["DIPLOMACOMPROMISO"],
      );

  Map<String, dynamic> toJson() => {
        "Codrecurso": codrecurso,
        "URLNombreCast": urlNombreCast,
        "Nombre": nombre,
        "URLNombreBuscador": urlNombreBuscador,
        "CodCategoria": codCategoria,
        "IdRecursoCategoria": idRecursoCategoria,
        "IDCATEGORIA": idcategoria,
        "TIPO": tipo,
        "NombreLocalidad": nombreLocalidad,
        "DescripZona": descripZona,
        "Path": path,
        "ImgFichero": imgFichero,
        "Distancia": distancia,
        "GEORR_X": georrX,
        "GEORR_Y": georrY,
        "DIPLOMACOMPROMISO": diplomacompromiso,
      };
}
