import 'dart:async';
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import 'clima.service.dart'; // Asegúrate de que el nombre del archivo sea correcto

void main() async {
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
  String? climaInfo;
  IconData? climaIcon;
   // Variable para almacenar la info del clima

  Future<void> fetchWeather() async {
    final weatherService = WeatherService();

    try {
      final weatherData = await weatherService.getWeather(ciudad!);
      var info1 =
          'Clima en ${weatherData['name']}:\n${weatherData['weather'][0]['description']}';
      var info2 = '${weatherData['main']['temp']}°C';
      var info3 = 'Viento: ${weatherData['wind']['speed']}m/s';
      var icono =  getWeatherIcon('${weatherData['weather'][0]['icon']}') ;
      setState(() {
        climaInfo =
            '$info1\n$info2\n$info3\n'; // Actualiza la info del clima
            climaIcon = icono; // Actualiza el icono del clima
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
                '$climaInfo',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Icon(climaIcon)
          ],
        ),
      ),
    );
  }
}

IconData getWeatherIcon(String weatherCode) {
  switch (weatherCode) {
    case "01d":
      return WeatherIcons.day_sunny;
    case "02d":
      return WeatherIcons.day_cloudy;
    case "03d":
      return WeatherIcons.cloud;
    case "04d":
      return WeatherIcons.cloudy;
    case "09d":
      return WeatherIcons.showers;
    case "10d":
      return WeatherIcons.rain;
    case "11d":
      return WeatherIcons.thunderstorm;
    case "13d":
      return WeatherIcons.snow;
    default:
      return WeatherIcons.refresh; // A fallback icon in case of unknown code
  }
}
