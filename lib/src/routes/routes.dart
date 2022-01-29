import 'package:actividad2/src/pages/ejercicio1.dart';
import 'package:actividad2/src/pages/ejercicio2.dart';
import 'package:actividad2/src/pages/ejercicio3.dart';
import 'package:actividad2/src/pages/home_page.dart';
import 'package:flutter/material.dart';

getApplicationRoutes() {
  return {
    '/': (BuildContext context) => HomePage(),
    'ejercicio1': (BuildContext context) => Ejercicio1Page(),
    'ejercicio2': (BuildContext context) => Ejercicio2Page(),
    'ejercicio3': (BuildContext context) => Ejercicio3Page(),
  };
}
