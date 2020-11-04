//import 'package:espacios_naturales/screens/principal_screen.dart';
import 'package:espacios_naturales/screens/zonas_geograficas_screen.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class PresentacionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 3,
        navigateAfterSeconds: ListaZonasGeograficasScreen(),
        title: new Text(
          'Espacios Naturales',
          style: new TextStyle(fontStyle: FontStyle.italic, fontSize: 30.0),
        ),
        image: new Image.network(
            'http://www.navarra.es/NR/rdonlyres/50841333-22E5-431E-873F-51AC3BEC30EB/54817/2804cu60b.jpg'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 120.0,
        onClick: () => print("Flutter Spain"),
        loadingText: Text("Embarcando..."),
        loaderColor: Colors.red);
  }
}
