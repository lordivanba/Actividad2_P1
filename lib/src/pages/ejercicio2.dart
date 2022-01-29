import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Ejercicio2Page extends StatefulWidget {
  Ejercicio2Page({Key? key}) : super(key: key);

  @override
  State<Ejercicio2Page> createState() => _Ejercicio2PageState();
}

class _Ejercicio2PageState extends State<Ejercicio2Page> {
  final _formKey = GlobalKey<FormState>();
  double _decimal = 0;
  double _binario = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ejercicio 2'),
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
                    'Conversión a binario',
                    style: TextStyle(fontSize: 30.0, color: Colors.white),
                  ),
                ),
                SizedBox(height: 10.0),
                Divider(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    'Crear un programa en Dart que transforme un numero decimal a su equivalencia en binario, por ejemplo, si usamos el método de la división sucesiva para calcular el valor binario del número 12, comenzaremos dividiendo 12 entre 2, luego cada cociente resultante se divide por 2 hasta que se obtiene un cociente cuya parte entera es 0.',
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
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      icon: Icon(Icons.input),
                      hintText: 'Ingrese un número decimal',
                      labelText: 'Número decimal',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa un número decimal';
                      }
                      _convertirBinario();
                      return null;
                    },
                    onChanged: (value) => setState(() {
                      _decimal = double.parse(value);
                    }),
                  ),
                ),
                SizedBox(height: 20.0),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                    child: Text('Transformar'),
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

  void _convertirBinario() {
    setState(() {
      int i = 1;
      double _numeroIngresado = _decimal;
      while (_decimal > 0) {
        _binario = _binario + (_decimal % 2) * i;
        _decimal = (_decimal / 2).floorToDouble();
        i = i * 10;
      }
      print('$_binario __ $_numeroIngresado');
      _alertaResultado(context, _numeroIngresado);
    });
  }

  _alertaResultado(context, _numeroIngresado) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
                child: Text(
              'Resultado',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
            )),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Numero ingresado: $_numeroIngresado'),
                SizedBox(
                  height: 15.0,
                ),
                Text('Numero convertido a binario: $_binario'),
                SizedBox(
                  height: 15.0,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, 'ejercicio2');
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
