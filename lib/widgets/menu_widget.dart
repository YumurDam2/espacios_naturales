import 'package:espacios_naturales/screens/tipo_seleccionado_screen.dart';
import 'package:espacios_naturales/screens/tipos_espacios_screens.dart';
import 'package:espacios_naturales/screens/zonas_geograficas_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MenuDrawer extends StatelessWidget {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    String zona = box.read('descripZona');
    String tipo = box.read('tipo');
    String nombre = box.read('nombre');
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: [
        DrawerHeader(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/montañas.jpg'),
                    fit: BoxFit.cover)),
          ),
        ),
        ListTile(
          leading: Icon(Icons.nature, color: Colors.green),
          title: Text('Zonas Geográficas'),
          onTap: () {
            Get.offAll(ListaZonasGeograficasScreen());
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.eco_outlined, color: Colors.green),
          title: Text('Tipos'),
          onTap: () {
            if (zona != null) {
              Get.offAll(ListaTiposEspaciosNaturalesScreen());
            }
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.eco, color: Colors.green),
          title: Text('Tipo seleccionado'),
          onTap: () {
            if ((zona != null) && (tipo != null)) {
              Get.offAll(ListaTipoEspacioNaturalSeleccionadoScreen());
            }
          },
        ),
      ]),
    );
  }
}
