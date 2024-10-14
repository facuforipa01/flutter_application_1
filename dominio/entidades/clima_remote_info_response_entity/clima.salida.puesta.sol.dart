import 'package:equatable/equatable.dart';

class SalidaPuestaSolClima extends Equatable{
  const SalidaPuestaSolClima({
    this.type,
    this.id,
    this.country,
    this.sunrise,
    this.sunset,
  });

  final int? type;
  final int? id;
  final String? country;
  final int? sunrise;
  final int? sunset;




  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();}


  //   "sys": {
  //   "type": 1,
  //   "id": 1193,
  //   "country": "TN",
  //   "sunrise": 1663045105,
  //   "sunset": 1663090127
  // },