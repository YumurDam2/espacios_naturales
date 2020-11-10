import 'package:espacios_naturales/models/espacios_naturales_models.dart';
import 'package:espacios_naturales/screens/mapa_puntos_screen.dart';
import 'package:espacios_naturales/screens/tipos_espacios_screens.dart';
import 'package:espacios_naturales/widgets/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:espacios_naturales/providers/menu_provider.dart';
import 'package:get/get.dart';

class ListaTipoEspacioNaturalSeleccionadoScreen extends StatelessWidget {
  Map<String, Object> args = new Map<String, Object>();

  @override
  Widget build(BuildContext context) {
    args = Get.arguments;
    String tipo = args['tipo'];
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            snap: true,
            floating: true,
            expandedHeight: 160,
            backgroundColor: Colors.lightGreen,
            iconTheme: IconThemeData(color: Colors.purple),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                tipo.toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.w300, // light
                  fontStyle: FontStyle.italic, // italic
                ),
              ),
              centerTitle: true,
              background: Image(
                image: AssetImage('assets/images/portada.png'),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SliverFillRemaining(
            child: _lista(context),
          )
        ],
      ),
      body: _lista(context),
      drawer: MenuDrawer(),
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

  List<Widget> _listaZonas(BuildContext context, List<EspaciosNaturales> data) {
    final List<Widget> lst = [];
    final tipo = args['descripZona'].toString();

    data.forEach((element) {
      final w = ListTile(
        title: Text(
          element.nombre.toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.w300, // light
            fontStyle: FontStyle.italic, // italic
          ),
          textAlign: TextAlign.center,
        ),
        // leading: Icon(Icons.eco),
        subtitle: Text(
          tipo.toUpperCase(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w300, // light
            fontStyle: FontStyle.italic, // italic
          ),
        ),
        trailing: Icon(
          Icons.arrow_right,
          color: Colors.black45,
        ),
        onTap: () {
          args['nombre'] = element.nombre;
          Get.offAll(MapaPuntosScreen(), arguments: element);
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
