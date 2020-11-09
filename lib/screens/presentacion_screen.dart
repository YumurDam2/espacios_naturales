//import 'package:espacios_naturales/screens/principal_screen.dart';
import 'package:espacios_naturales/screens/zonas_geograficas_screen.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class PresentacionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 5,
        navigateAfterSeconds: ListaZonasGeograficasScreen(),
        title: new Text(
          'Espacios Naturales',
          style: new TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 30.0,
              fontWeight: FontWeight.w300),
        ),
        image: Image(image: AssetImage('assets/images/logo_turismo.jpg')),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 120.0,
        onClick: () => print("Flutter Spain"),
        loadingText: Text(
          "Embarcando...",
          style: TextStyle(
            fontWeight: FontWeight.w300, // light
            fontStyle: FontStyle.italic, // italic
          ),
        ),
        loaderColor: Colors.red);
  }
}
