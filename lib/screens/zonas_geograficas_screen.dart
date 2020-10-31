import 'package:flutter/material.dart';

class ListaZonasGeograficasScreen extends StatelessWidget {
  final listaZonas = ['Pirineos', 'Cuenca de Pamplona', 'Zona Media', 'Ribera'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Zonas Geográficas"),
      ),
      body: ListView(
        children: _listaZonas(),
      ),
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
