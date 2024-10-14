import 'package:flutter/material.dart';

class HolaMundoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hola Mundo App'),
        ),
        body: Center(
          child: Text('Hola Mundo'),
        ),
      ),
    ));
  }
}
