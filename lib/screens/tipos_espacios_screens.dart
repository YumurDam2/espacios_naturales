import 'package:flutter/material.dart';
import 'package:espacios_naturales/providers/menu_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ListaTiposEspaciosNaturalesScreen extends StatelessWidget {
  Map<String, Object> args = new Map<String, Object>();
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    box.write('tipo', null);
    box.write('nombre', null);
    return Scaffold(
      appBar: AppBar(
        title: Text("Tipos Espacios Naturales"),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),
      body: _lista(context),
    );
  }

  Widget _lista(BuildContext context) {
    return FutureBuilder(
      future: menuProvider
          .cargarTipos(box.read('descripZona') ?? args['descripZona']),
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
        trailing: Icon(
          Icons.arrow_right,
          color: Colors.green,
        ),
        onTap: () {
          box.write('tipo', element);
          args['tipo'] = element;
          //Get.offAll(, arguments: args);
        },
      );
      lst.add(w);
      lst.add(Divider(
        height: 50,
        thickness: 2,
        color: Colors.black45,
      ));
    });
    return lst;
  }
}
