import 'package:espacios_naturales/screens/tipos_espacios_screens.dart';
import 'package:espacios_naturales/screens/zonas_geograficas_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MenuDrawer extends StatelessWidget {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    String zona = box.read('zona');
    String tipo = box.read('tipo');
    String tipoEspacio = box.read('tipoEspacio');
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: [
        DrawerHeader(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(''),
                    fit: BoxFit.cover)),
          ),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.business, color: Colors.green),
          title: Text('Zonas Geográficas'),
          onTap: () {
            Get.offAll(ListaZonasGeograficasScreen());
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.location_city, color: Colors.green),
          title: Text('Tipos'),
          onTap: () {
            if (zona != null) {
              Get.offAll(ListaTiposEspaciosNaturalesScreen());
            }
          },
        ),
        Divider(),
      ]),
    );
  }
}