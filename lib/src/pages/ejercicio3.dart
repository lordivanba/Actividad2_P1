import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:math';

class Ejercicio3Page extends StatefulWidget {
  Ejercicio3Page({Key? key}) : super(key: key);

  @override
  State<Ejercicio3Page> createState() => _Ejercicio3PageState();
}

class _Ejercicio3PageState extends State<Ejercicio3Page> {
  final _formKey = GlobalKey<FormState>();

  double _pesoKg = 0.0;
  double _estaturaMetros = 0.0;

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
                    'Calcular IMC',
                    style: TextStyle(fontSize: 30.0, color: Colors.white),
                  ),
                ),
                SizedBox(height: 20.0),
                Divider(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    'El índice de masa corporal o IMC de una persona es una medida calculada de su peso con relación a su estatura. Este número sirve como una estimación rápida de la grasa corporal. Clasifica a las personas en categorías de peso, tales como con bajo peso, con sobrepeso y con obesidad.',
                    style:
                        TextStyle(fontSize: 15.0, fontStyle: FontStyle.normal),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Container(
                  padding: EdgeInsets.only(left: 30.0, right: 30.0),
                  child: TextFormField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    // inputFormatters: [FilteringTextInputFormatter.allow(filterPattern)],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      icon: Icon(Icons.line_weight),
                      hintText: 'Ingrese su peso en kilogramos ',
                      labelText: 'Peso',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa el peso en kg';
                      }
                      return null;
                    },
                    onChanged: (value) => setState(() {
                      _pesoKg = double.parse(value);
                    }),
                  ),
                ),
                Divider(),
                Container(
                  padding: EdgeInsets.only(left: 30.0, right: 30.0),
                  child: TextFormField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    // inputFormatters: [FilteringTextInputFormatter.allow(filterPattern)],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      icon: Icon(Icons.height),
                      hintText: 'Ingrese su estatura en metros ',
                      labelText: 'Estatura',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa la estatura en metros';
                      }
                      print("$_pesoKg, $_estaturaMetros");
                      _calcularImc();
                      return null;
                    },
                    onChanged: (value) => setState(() {
                      _estaturaMetros = double.parse(value);
                    }),
                  ),
                ),
                SizedBox(height: 20.0),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                    child: Text('Calcular'),
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
                ),
              ],
            )));
  }

  void _calcularImc() {
    double _imc;
    String _composicionCorporal;

    _imc =
        double.parse((_pesoKg / (pow(_estaturaMetros, 2))).toStringAsFixed(2));

    if (_imc < 18.5) {
      _composicionCorporal = "Peso inferior al normal";
    } else if (_imc >= 18.5 && _imc <= 24.99) {
      _composicionCorporal = "Normal";
    } else if (_imc >= 25 && _imc <= 29.99) {
      _composicionCorporal = "Peso superior al normal";
    } else {
      _composicionCorporal = "Obesidad";
    }

    print("IMC: $_imc. Composicion corporal: $_composicionCorporal");

    _mostrarResultado(context, _imc, _composicionCorporal);
  }

  _mostrarResultado(context, _imc, _composicionCorporal) {
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
                Text('Peso: $_pesoKg'),
                SizedBox(
                  height: 15.0,
                ),
                Text('Estatura: $_estaturaMetros'),
                SizedBox(
                  height: 15.0,
                ),
                Text('IMC: $_imc'),
                SizedBox(
                  height: 15.0,
                ),
                Text('Composición corporal: $_composicionCorporal'),
                SizedBox(
                  height: 15.0,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, 'ejercicio3');
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
