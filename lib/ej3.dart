import 'package:flutter/material.dart';

class TarjetaDePerfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Profile Card'),
        ),
        body: Center(
          child: Container(
              margin: EdgeInsets.all(10),
              child: ListView(
                children: [
                  SizedBox(width: 50),
                  Column(
                    children: [
                      CircleAvatar(
                        foregroundImage: AssetImage('assets/yo-mate.jpg'),
                        radius: 50,
                      ),
                      Text(
                        'Facundo Folatelli',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text('Desarrollador de Software Full Stack',
                          textAlign: TextAlign.left),
                      Text('Contacto: 2991234567', textAlign: TextAlign.left),
                      Text('Email: facufola@gmail.com',
                          textAlign: TextAlign.left),
                    ],
                  ),
                ],
              )),
        ),
      ),
    ));
  }
}
