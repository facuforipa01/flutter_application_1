import 'package:flutter/material.dart';

class BienvenidaNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Navegacion'),
        ),
        body: Center(
          child: Text('Mensaje de Bienvenida! soy la pantalla 1'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Pantalla2()),
            );
          },
          tooltip: 'siguiente',
          child: Icon(Icons.arrow_circle_right),
        ),
      ),
    ));
  }
}

class Pantalla2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Navegacion'),
        ),
        body: Center(
          child: Text('soy la pantalla 2'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(
              context
            );
          },
          tooltip: 'volver',
          child: Icon(Icons.arrow_circle_left),
        ),
      ),
    ));
  }
}
