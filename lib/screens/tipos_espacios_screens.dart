import 'package:flutter/material.dart';
import 'package:espacios_naturales/providers/menu_provider.dart';
import 'package:get/get.dart';

class ListaTiposEspaciosNaturalesScreen extends StatelessWidget {
  Map<String, Object> args = new Map<String, Object>();
  @override
  Widget build(BuildContext context) {
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
      future: menuProvider.cargarTipos(args['zona']),
      initialData: [],
      builder: (context, snapshot) {
        return ListView(
          children: _listaZonas(context, snapshot.data),
        );
      },
    );
  }

  List<Widget> _listaZonas(BuildContext context, List<String> data) {
    final List<Widget> lst = [];

    data.forEach((element) {
      final w = ListTile(
        title: Text(element),
        leading: new Icon(Icons.eco_outlined, color: Colors.green),
        trailing: Icon(
          Icons.arrow_right,
          color: Colors.green,
        ),
        onTap: () {
          args['zona'] = element;
          //Get.offAll(, arguments: args);
        },
      );
      lst.add(w);
      lst.add(Divider(
        height: 50,
        thickness: 2,
        indent: 100,
        endIndent: 100,
        color: Colors.green,
      ));
    });
    return lst;
  }
}
