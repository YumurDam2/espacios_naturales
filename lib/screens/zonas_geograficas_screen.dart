import 'package:espacios_naturales/providers/menu_provider.dart';
import 'package:flutter/material.dart';

class ListaZonasGeograficasScreen extends StatelessWidget {
  // final listaZonas = ['Pirineos', 'Cuenca de Pamplona', 'Zona Media', 'Ribera'];
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
          return ListView(
            children: _listaZonas(context, snapshot.data),
          );
      },
    );
  }


  List<Widget> _listaZonas(BuildContext context, List<String> data) {
  //   final List<Widget> opciones = [];
  //   data.forEach((opt) {
  //     final widgetTemp = ListTile(
  //       title: Text(opt["Descripcion Zona"]),
  //       onTap: () {},
  //     );
  //     opciones..add(widgetTemp)
  //             ..add(Divider());
  //   });
  //   return opciones;
  // }
     final List<Widget> lst = [];
     
    data.forEach((element) {
      final w = ListTile(
        title: Text(element),
        leading: new Image.network(
            'https://www.bcn.cl/siit/siit/imagenes/mountains-1.png'),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.green,),
        onTap: () {
          
          
        },
      );
      lst.add(w);
      lst.add(Divider(
        height: 100,
        thickness: 2,
        indent: 100,
        endIndent: 100,
        color: Colors.green,
      ));
    });
    return lst;
  }
}
