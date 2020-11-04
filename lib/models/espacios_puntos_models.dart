import 'package:espacios_naturales/models/espacios_naturales_models.dart';

class Espacios {
  List<EspaciosNaturales> lista = new List();
  Espacios.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    jsonList.forEach((json) {
      final pr = EspaciosNaturales.fromJson(json);
      lista.add(pr);
    });
  }
}
