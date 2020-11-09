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
    box.write('tipo', null);
    box.write('nombre', null);
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
                "ZONAS GEOGRÁFICAS",
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
        title: Text(
          element.toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.w300, // light
            fontStyle: FontStyle.italic, // italic
          ),
          textAlign: TextAlign.center,
        ),
        subtitle: Text(
          'NAVARRA',
          style: TextStyle(
            fontWeight: FontWeight.w300, // light
            fontStyle: FontStyle.italic, // italic
          ),
          textAlign: TextAlign.center,
        ),
        //leading: Icon(Icons.nature_people),
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
        height: 80,
        thickness: 1,
        color: Colors.black,
      ));
    });
    return lst;
  }
}
