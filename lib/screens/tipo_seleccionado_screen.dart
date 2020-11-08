import 'package:espacios_naturales/screens/tipos_espacios_screens.dart';
import 'package:flutter/material.dart';
import 'package:espacios_naturales/providers/menu_provider.dart';
import 'package:get/get.dart';

class ListaTipoEspacioNaturalSeleccionadoScreen extends StatelessWidget {
  Map<String, Object> args = new Map<String, Object>();

  @override
  Widget build(BuildContext context) {
    args = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Nombres Espacios Naturales"),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),
      body: _lista(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.offAll(ListaTiposEspaciosNaturalesScreen(), arguments: args);
        },
        child: Icon(Icons.arrow_back),
        backgroundColor: Colors.black45,
      ),
    );
  }

  Widget _lista(BuildContext context) {
    args = Get.arguments;
    return FutureBuilder(
      future: menuProvider.cargarTipoSeleccionado(args['tipo']),
      initialData: [],
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView(
            children: _listaZonas(context, snapshot.data),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
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
          color: Colors.black45,
        ),
        onTap: () {
          args['nombre'] = element;
          //Get.offAll(, arguments: args);
        },
      );
      lst.add(w);
      lst.add(Divider(
        height: 20,
        thickness: 1,
        color: Colors.black45,
      ));
    });
    return lst;
  }
}
