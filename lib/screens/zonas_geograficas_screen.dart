import 'package:espacios_naturales/providers/menu_provider.dart';
import 'package:espacios_naturales/screens/tipos_espacios_screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListaZonasGeograficasScreen extends StatelessWidget {
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
      future: menuProvider.cargarZonas(),
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

        leading: Icon(Icons.nature),

        trailing: Icon(
          Icons.arrow_right,
          color: Colors.green,
        ),
        onTap: () {
          args['descripZona'] = element;
          Get.offAll(ListaTiposEspaciosNaturalesScreen(), arguments: args);
        },
      );
      lst.add(w);
      lst.add(Divider(
        height: 100,
        thickness: 2,
        
        color: Colors.green,
      ));
    });
    return lst;
  }
}
