import 'package:equatable/equatable.dart';

import 'clima.description.dart';
import 'clima.main.dart';
import 'clima.nubosidad.dart';
import 'clima.salida.puesta.sol.dart';
import 'clima.tema.dart';
import 'clima.viento.dart';

class ClimaInfoEntity extends Equatable {

  const ClimaInfoEntity({
    this.clima, //object clima
    this.main, //datos principales condiciones meteorologicas
    this.visibilidad,
    this.viento,
    this.nubosidad,
    this.salidaPuestaSol,
    this.timeZone,
    this.id,
    this.name,
    this.climaTema,
  }); 

  final List<ClimaDescription?>? clima;
  final MainClima? main;
  final String? visibilidad;
  final VientoClima? viento;
  final NubosidadClima? nubosidad;
  final SalidaPuestaSolClima? salidaPuestaSol;
  final int? timeZone;
  final int? id;
  final String? name;
  final TemaClima? climaTema;
  
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
  
}

