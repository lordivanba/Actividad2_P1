import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  // const HomePage({Key? key}) : super(key: key);

  final _txtStyle = TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Actividad 2'),
      ),
      body: ListView(
        children: [
          SizedBox(height: 30.0),
          ListTile(
            style: ListTileStyle.drawer,
            title: Text(
              'Ejercicio 1',
              style: _txtStyle,
            ),
            trailing: Icon(Icons.keyboard_arrow_right),
            leading: Icon(Icons.task_alt),
            onTap: () {
              Navigator.pushNamed(context, 'ejercicio1');
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              'Ejercicio 2',
              style: _txtStyle,
            ),
            trailing: Icon(Icons.keyboard_arrow_right),
            leading: Icon(Icons.task_alt),
            onTap: () {
              Navigator.pushNamed(context, 'ejercicio2');
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              'Ejercicio 3',
              style: _txtStyle,
            ),
            trailing: Icon(Icons.keyboard_arrow_right),
            leading: Icon(Icons.task_alt),
          ),
          Divider(),
          ListTile(
            title: Text(
              'Ejercicio 4',
              style: _txtStyle,
            ),
            trailing: Icon(Icons.keyboard_arrow_right),
            leading: Icon(Icons.task_alt),
          ),
        ],
      ),
    );
  }
}
