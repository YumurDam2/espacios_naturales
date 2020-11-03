import 'package:espacios_naturales/providers/menu_provider.dart';
import 'package:flutter/material.dart';

class ListaZonasGeograficasScreen extends StatelessWidget {
  final listaZonas = ['Pirineos', 'Cuenca de Pamplona', 'Zona Media', 'Ribera'];
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
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView(
            children: _listaZonas(),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }


  List<Widget> _listaZonas() {
    List<Widget> lst = [];
    listaZonas.forEach((zona) {
      final tile = new ListTile(
        title: Text(zona),
      );
      lst.add(tile);
      lst.add(Divider());
    });
    return lst;
  }
}
