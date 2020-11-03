import 'package:espacios_naturales/providers/menu_provider.dart';
import 'package:flutter/material.dart';

class ListaZonasGeograficasScreen extends StatelessWidget {
  // final listaZonas = ['Pirineos', 'Cuenca de Pamplona', 'Zona Media', 'Ribera'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Zonas Geográficas"),
      ),
      body: _lista(),
      );
  }

  Widget _lista() {
    return FutureBuilder(
      future: menuProvider.cargarZona(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) { 
          return ListView(
            children: _listaZonas(snapshot.data),
          );
      },
    );
  }


  List<Widget> _listaZonas(List<dynamic> data) {
    final List<Widget> opciones = [];
    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt["Descripcion Zona"]),
        onTap: () {},
      );
      opciones..add(widgetTemp)
              ..add(Divider());
    });
    return opciones;
  }
}
