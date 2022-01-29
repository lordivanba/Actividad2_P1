import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Ejercicio4Page extends StatefulWidget {
  Ejercicio4Page({Key? key}) : super(key: key);

  @override
  State<Ejercicio4Page> createState() => _Ejercicio4PageState();
}

class _Ejercicio4PageState extends State<Ejercicio4Page> {
  final _formKey = GlobalKey<FormState>();
  String _frase = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ejercicio 4'),
          leading: IconButton(
              onPressed: () => Navigator.pushNamed(context, '/'),
              icon: Icon(Icons.keyboard_arrow_left)),
        ),
        body: Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              children: [
                Center(
                  child: Text(
                    'Palíndromos',
                    style: TextStyle(fontSize: 30.0, color: Colors.white),
                  ),
                ),
                SizedBox(height: 10.0),
                Divider(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    'Los palíndromos son palabras o frases que al leerse de izquierda a derecha y viceversa expresan o tienen el mismo sentido. A este vocablo también se le puede llamar palíndromas. Elorigen del vocablo proviene del término griego palin dromein, que significa volver a ir atrás.',
                    style:
                        TextStyle(fontSize: 15.0, fontStyle: FontStyle.normal),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    'Un palíndromo puede ser sencillo de leer de derecha a izquierda si está constituido por una o dos palabras. Sin embargo, adquiere complejidad cuando la frase gana longitud o es extensa, eso se debe a que a simple vista puede no tener sentido. Un ejemplo de palíndromo es “Allí va Ramón y no maravilla',
                    style:
                        TextStyle(fontSize: 15.0, fontStyle: FontStyle.normal),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Container(
                  padding: EdgeInsets.only(left: 40.0, right: 40.0),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      icon: Icon(Icons.text_fields),
                      hintText: 'Ingrese una frase',
                      labelText: 'Frase',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa una frase';
                      }
                      return null;
                    },
                    onChanged: (value) => setState(() {
                      _frase = value;
                    }),
                  ),
                ),
                SizedBox(height: 20.0),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _evaluarFrase();
                      }
                    },
                    child: Text('Evaluar'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black87,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0)),
                      padding: EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 25.0),
                      elevation: 10.0,
                      textStyle: TextStyle(fontSize: 18.0),
                    ),
                  ),
                )
              ],
            )));
  }

  void _evaluarFrase() {
    int _cantidadPalabras = _frase.split(' ').length;
    String _fraseLower = _frase
        .toLowerCase()
        .replaceAll(' ', '')
        .replaceAll(new RegExp(r'[^\w\s]+'), '');
    String _fraseInversa =
        _fraseLower.split('').reversed.join().replaceAll(' ', '');

    print(_cantidadPalabras);
    if (_fraseInversa == _fraseLower) {
      _alertaPalindromo(context);
    } else {
      _alertaNoPalindromo();
    }

    //   print('here');
    //   String palabra, inverso, caracter;
    //   int i;
    //   int count = _frase.split(' ').length;

    //   palabra = _frase.toLowerCase().replaceAll(' ', '');
    //   i = palabra.length;
    //   inverso = '';

    //   for (int x = i - 1; x >= 0; x--) {
    //     caracter = palabra.substring(x, 1);
    //     inverso = inverso + caracter;
    //   }

    //   if (palabra == inverso) {
    //     // _alertaPalindromo();
    //     print('es palindromo');
    //   } else {
    //     // _alertaNoPalindromo();
    //     print('no es palindromo');
    //   }

    //   // print(inverso);
    // }

    // void _alertaPalindromo() {
    //   print('es palindromo');
    // }

    // void _alertaNoPalindromo() {
    //   print('no es palindromo');
    // }
  }

  Future _alertaPalindromo(context) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
            title: Center(
              child: Text(
                'Resultado',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('La palabra es palíndroma'),
                SizedBox(
                  height: 15.0,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, 'ejercicio4');
                  },
                  icon: Icon(Icons.done),
                  label: Text('Ok'),
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(13.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0))),
                ),
              ],
            ),
          );
        });
  }

  Future _alertaNoPalindromo() {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
            title: Center(
              child: Text(
                'Resultado',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('La palabra no es palíndroma'),
                SizedBox(
                  height: 15.0,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, 'ejercicio4');
                  },
                  icon: Icon(Icons.done),
                  label: Text('Ok'),
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(13.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0))),
                ),
              ],
            ),
          );
        });
  }
}
