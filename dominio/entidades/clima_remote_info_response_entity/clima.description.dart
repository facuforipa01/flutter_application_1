import 'package:equatable/equatable.dart';

class ClimaDescription extends Equatable{

const ClimaDescription({
this.id,
this.main,
this.description,
this.icon,
});

final int? id;
final String? main;
final String? description;
final String? icon;



  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}


      // "id": 801,
      // "main": "Clouds",
      // "description": "few clouds",
      // "icon": "02d"
    