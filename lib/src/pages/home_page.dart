import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Actividad 2'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Ejercicio 1'),
            onTap: () {
              Navigator.pushNamed(context, 'ejercicio1');
            },
          ),
          ListTile(
            title: Text('Ejercicio 2'),
          ),
          ListTile(
            title: Text('Ejercicio 3'),
          ),
          ListTile(
            title: Text('Ejercicio 4'),
          ),
        ],
      ),
    );
  }
}
