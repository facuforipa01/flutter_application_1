
import 'package:equatable/equatable.dart';

class MainClima extends Equatable{
  const MainClima({
    this.temp,
    this.feels_like,
    this.temp_min,
    this.temp_max,
    this.pressure,
    this.humidity,
  });

  final double? temp;
  final double? feels_like;
  final double? temp_min;
  final double? temp_max;
  final int? pressure;
  final int? humidity;

  

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();}










// "main": {
//     "temp": 304.03,
//     "feels_like": 307.27,
//     "temp_min": 303.02,
//     "temp_max": 304.03,
//     "pressure": 1014,
//     "humidity": 58
//   },