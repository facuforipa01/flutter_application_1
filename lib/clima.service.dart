import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  final String baseUrl;

  static var info1;

  WeatherService({this.baseUrl = 'https://api.openweathermap.org/data/2.5'});
  Future<Map<String, dynamic>> getWeather(String city) async {
    final String apiKey = '${dotenv.env['KEY']}';
    final response = await http.get(Uri.parse(
        '$baseUrl/weather?q=$city&appid=$apiKey&units=metric&lang=es'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
