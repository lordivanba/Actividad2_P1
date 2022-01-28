import 'package:flutter/material.dart';

class Ejercicio1Page extends StatefulWidget {
  Ejercicio1Page({Key? key}) : super(key: key);

  @override
  State<Ejercicio1Page> createState() => _Ejercicio1PageState();
}

class _Ejercicio1PageState extends State<Ejercicio1Page> {
  final _formKey = GlobalKey<FormState>();

  int _hrSemana1 = 0;
  int _hrSemana2 = 0;
  int _hrSemana3 = 0;
  int _hrSemana4 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicio 1'),
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 50.0),
          children: [
            Center(
              child: Text(
                'Calcular salario semanal',
                style: TextStyle(fontSize: 30.0, color: Colors.blue),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 80.0, right: 80.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  icon: Icon(Icons.timer),
                  hintText: 'Ingrese las horas trabajadas',
                  labelText: 'Horas',
                  helperText: 'Semana 1',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa las horas trabajadas';
                  }
                  return null;
                },
                onChanged: (value) => setState(() {
                  _hrSemana1 = int.parse(value);
                }),
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.only(left: 80.0, right: 80.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    icon: Icon(Icons.timer),
                    hintText: 'Ingrese las horas trabajadas',
                    labelText: 'Horas',
                    helperText: 'Semana 2'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa las horas trabajadas';
                  }
                  return null;
                },
                onChanged: (value) => setState(() {
                  _hrSemana2 = int.parse(value);
                }),
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.only(left: 80.0, right: 80.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    icon: Icon(Icons.timer),
                    hintText: 'Ingrese las horas trabajadas',
                    labelText: 'Horas',
                    helperText: 'Semana 3'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa las horas trabajadas';
                  }
                  return null;
                },
                onChanged: (value) => setState(() {
                  _hrSemana3 = int.parse(value);
                }),
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.only(left: 80.0, right: 80.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    icon: Icon(Icons.timer),
                    hintText: 'Ingrese las horas trabajadas',
                    labelText: 'Horas',
                    helperText: 'Semana 4'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa las horas trabajadas';
                  }
                  return null;
                },
                onChanged: (value) => setState(() {
                  _hrSemana4 = int.parse(value);
                }),
              ),
            ),
            SizedBox(height: 20.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // print('is validated');
                    _calcularSalario(context);
                  }
                  // print('is not validated');
                  // print('$_hrSemana1, $_hrSemana2, $_hrSemana3, $_hrSemana4');
                },
                child: Text('Calcular'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0)),
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 25.0),
                  elevation: 10.0,
                  textStyle: TextStyle(fontSize: 18.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _calcularSalario(context) {
    double _salarioPorHora = 120.0;
    double _salarioPorHoraExtra = 175.0;
    double _salarioSemana1;
    double _salarioSemana2;
    double _salarioSemana3;
    double _salarioSemana4;
    double _salarioTotal;

    int _actas = 0;
    int _hrTotal = _hrSemana1 + _hrSemana2 + _hrSemana3 + _hrSemana4;

    if (_hrSemana1 < 27) {
      _actas = _actas + 1;
    }
    if (_hrSemana2 < 27) {
      _actas = _actas + 1;
    }
    if (_hrSemana3 < 27) {
      _actas = _actas + 1;
    }
    if (_hrSemana4 < 27) {
      _actas = _actas + 1;
    }

    if (_actas == 1) {
      print("actas: $_actas");
      _salarioTotal = _salarioPorHora * _hrTotal;

      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)),
              title: Center(
                child: Text(
                  'Aviso',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                      'En una semana has trabajado menos de 27 horas. Por tanto, se te ha levantado una acta administrativa.'),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text('Total de horas: $_hrTotal'),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text('Salario total: $_salarioTotal MXN'),
                  SizedBox(
                    height: 15.0,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, 'ejercicio1');
                    },
                    icon: Icon(Icons.done),
                    label: Text('Enterado'),
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(13.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0))),
                  ),
                ],
              ),
            );
          });
    } else if (_actas >= 2) {
      print("actas: $_actas");

      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)),
              title: Center(
                child: Text(
                  'Aviso',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                      'Has trabajado menos de 27 horas en al menos 2 semanas por lo que por se han acumulado dos actas administrativas ocasionado tu despido de la empresa.'),
                  SizedBox(
                    height: 15.0,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, 'ejercicio1');
                    },
                    icon: Icon(Icons.done),
                    label: Text('Enterado'),
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(13.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0))),
                  ),
                ],
              ),
            );
          });
    } else if (_hrTotal <= 160) {
      _salarioTotal = _hrTotal * _salarioPorHora;
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)),
              title: Center(
                child: Text(
                  'Aviso',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Total de horas trabajadas: $_hrTotal'),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text('Salario total: $_salarioTotal MXN'),
                  SizedBox(
                    height: 15.0,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, 'ejercicio1');
                    },
                    icon: Icon(Icons.done),
                    label: Text('Enterado'),
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(13.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0))),
                  ),
                ],
              ),
            );
          });
    } else if (_hrTotal > 140) {
      int _horasExtra = _hrTotal - 140;
      _salarioTotal =
          (140 * _salarioPorHora) + (_horasExtra * _salarioPorHoraExtra);
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)),
              title: Center(
                child: Text(
                  'Aviso',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Total de horas trabajadas: $_hrTotal'),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text('Total de horas extra trabajadas: $_horasExtra'),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text('Salario total: $_salarioTotal MXN'),
                  SizedBox(
                    height: 15.0,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, 'ejercicio1');
                    },
                    icon: Icon(Icons.done),
                    label: Text('Enterado'),
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

    // if (_hrTotal < 13) {
    //   showDialog(
    //       barrierDismissible: false,
    //       context: context,
    //       builder: (context) {
    //         return AlertDialog(
    //           shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(25.0)),
    //           title: Center(
    //             child: Text(
    //               'Aviso',
    //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
    //             ),
    //           ),
    //           content: Column(
    //             mainAxisSize: MainAxisSize.min,
    //             children: [
    //               Text(
    //                   'Las horas trabajadas son menores a 13 que corresponde a 2 actas administrativas. Por lo tanto, se la informa que ha sido despedido.'),
    //               SizedBox(
    //                 height: 15.0,
    //               ),
    //               ElevatedButton.icon(
    //                 onPressed: () {
    //                   Navigator.pushNamed(context, 'ejercicio1');
    //                 },
    //                 icon: Icon(Icons.done),
    //                 label: Text('Enterado'),
    //                 style: ElevatedButton.styleFrom(
    //                     padding: EdgeInsets.all(13.0),
    //                     shape: RoundedRectangleBorder(
    //                         borderRadius: BorderRadius.circular(12.0))),
    //               ),
    //             ],
    //           ),
    //         );
    //       });
    // } else if (_hrTotal < 27) {
    //   _salarioTotal = _salarioPorHora * _hrTotal;

    //   showDialog(
    //       barrierDismissible: false,
    //       context: context,
    //       builder: (context) {
    //         return AlertDialog(
    //           shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(25.0)),
    //           title: Center(
    //             child: Text(
    //               'Aviso',
    //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
    //             ),
    //           ),
    //           content: Column(
    //             mainAxisSize: MainAxisSize.min,
    //             children: [
    //               Text(
    //                   'Las horas trabajadas ingresadas son menores a 27, por tanto se le ha levantado una acta administrativa.'),
    //               SizedBox(
    //                 height: 15.0,
    //               ),
    //               Text('Total de horas: $_hrTotal'),
    //               SizedBox(
    //                 height: 15.0,
    //               ),
    //               Text('Salario total: $_salarioTotal MXN'),
    //               SizedBox(
    //                 height: 15.0,
    //               ),
    //               ElevatedButton.icon(
    //                 onPressed: () {
    //                   Navigator.pushNamed(context, 'ejercicio1');
    //                 },
    //                 icon: Icon(Icons.done),
    //                 label: Text('Enterado'),
    //                 style: ElevatedButton.styleFrom(
    //                     padding: EdgeInsets.all(13.0),
    //                     shape: RoundedRectangleBorder(
    //                         borderRadius: BorderRadius.circular(12.0))),
    //               ),
    //             ],
    //           ),
    //         );
    //       });
    // } else if (_hrTotal > 27 && _hrTotal < 40) {
    //   _salarioTotal = _salarioPorHora * _hrTotal;
    //   showDialog(
    //       barrierDismissible: false,
    //       context: context,
    //       builder: (context) {
    //         return AlertDialog(
    //           shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(25.0)),
    //           title: Center(
    //             child: Text(
    //               'Aviso',
    //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
    //             ),
    //           ),
    //           content: Column(
    //             mainAxisSize: MainAxisSize.min,
    //             children: [
    //               Text('Total de horas: $_hrTotal'),
    //               SizedBox(
    //                 height: 15.0,
    //               ),
    //               Text('Salario total: $_salarioTotal MXN'),
    //               SizedBox(
    //                 height: 15.0,
    //               ),
    //               ElevatedButton.icon(
    //                 onPressed: () {
    //                   Navigator.pushNamed(context, 'ejercicio1');
    //                 },
    //                 icon: Icon(Icons.done),
    //                 label: Text('Enterado'),
    //                 style: ElevatedButton.styleFrom(
    //                     padding: EdgeInsets.all(13.0),
    //                     shape: RoundedRectangleBorder(
    //                         borderRadius: BorderRadius.circular(12.0))),
    //               ),
    //             ],
    //           ),
    //         );
    //       });
  }
}
