import 'package:flutter/material.dart';
import 'clima.service.dart'; // Asegúrate de que el nombre del archivo sea correcto

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clima App',
      home: Clima(),
    );
  }
}

class Clima extends StatefulWidget {
  @override
  _ClimaState createState() => _ClimaState();
}

class _ClimaState extends State<Clima> {
  final _formKey = GlobalKey<FormState>();
  String? ciudad;
  String? climaInfo; // Variable para almacenar la info del clima

  Future<void> fetchWeather() async {
    final weatherService = WeatherService('eaad0841e94e659d73d0c7896dcd0b58');

    try {
      final weatherData = await weatherService.getWeather(ciudad!);
      var info1 = 'Clima en ${weatherData['name']}: ${weatherData['weather'][0]['description']}';
      var info2 = 'Calentura: ${weatherData['main']['temp']}°C';
      var info3 = 'Vientoide: ${weatherData['wind']['speed']}m/s';
       var info4 = 'Vientoide: ${weatherData['weather'][0]['icon']}';
      // iconUrl = 'http://openweathermap.org/img/wn/$info4@2x.png';
      setState(() {
        climaInfo = '$info1\n$info2\n$info3\n$info4'; // Actualiza la info del clima
      });
    } catch (e) {
      setState(() {
        climaInfo = 'Error: $e'; // Maneja el error
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Ciudad',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese la ciudad';
                }
                return null;
              },
              onSaved: (value) {
                ciudad = value;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  _formKey.currentState?.save();
                  fetchWeather(); // Llama a la función para obtener el clima
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Buscando clima...')),
                  );
                }
              },
              child: Text('Buscar'),
            ),
            SizedBox(height: 20),
            if (climaInfo != null) // Muestra la información del clima si existe
              Text(
                'Info Clima: $climaInfo',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}
