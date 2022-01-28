import 'package:actividad2/src/pages/ejercicio1.dart';
import 'package:actividad2/src/pages/home_page.dart';
import 'package:flutter/material.dart';

getApplicationRoutes() {
  return {
    '/': (BuildContext context) => HomePage(),
    'ejercicio1': (BuildContext context) => Ejercicio1Page(),
  };
}
