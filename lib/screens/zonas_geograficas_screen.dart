import 'package:espacios_naturales/providers/menu_provider.dart';
import 'package:espacios_naturales/screens/tipos_espacios_screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ListaZonasGeograficasScreen extends StatelessWidget {
  final box = GetStorage();

  Map<String, Object> args = new Map<String, Object>();
  @override
  Widget build(BuildContext context) {
    box.write('descripZona', null);
    box.write('TIPO', null);
    box.write('Nombre', null);
    return Scaffold(
      appBar: AppBar(
        title: Text("Zonas Geográficas"),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),
      body: _lista(context),
    );
  }

  Widget _lista(BuildContext context) {
    return FutureBuilder(
      future: menuProvider.cargarZonas(),
      initialData: [],
      builder: (context, snapshot) {
        return ListView(
          children: _listaZonas(context, snapshot.data),
        );
      },
    );
  }

  List<Widget> _listaZonas(BuildContext context, List<dynamic> data) {
    final List<Widget> lst = [];

    data.forEach((element) {
      final w = ListTile(
        title: Text(element),
        leading: new Image.network(
            'https://www.bcn.cl/siit/siit/imagenes/mountains-1.png%27'),
        trailing: Icon(
          Icons.arrow_right,
          color: Colors.black45,
        ),
        onTap: () {
          box.write('descripZona', element);
          args['descripZona'] = element;
          Get.offAll(ListaTiposEspaciosNaturalesScreen(), arguments: args);
        },
      );
      lst.add(w);
      lst.add(Divider(
        height: 100,
        thickness: 2,
        color: Colors.black45,
      ));
    });
    return lst;
  }
}
