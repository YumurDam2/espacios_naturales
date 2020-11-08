import 'package:espacios_naturales/screens/presentacion_screen.dart';
import 'package:espacios_naturales/screens/tipos_espacios_screens.dart';
import 'package:espacios_naturales/screens/zonas_geograficas_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

//void main() => runApp(MyApp());
main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    String descripZona = box.read('descripZona');
    String tipo = box.read('tipo');
    String nombre = box.read('nombre');

    return GetMaterialApp(home: PresentacionScreen());
  }
}
