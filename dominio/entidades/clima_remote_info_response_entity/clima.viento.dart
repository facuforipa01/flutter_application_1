import 'package:equatable/equatable.dart';

class VientoClima extends Equatable{
  const VientoClima({
    this.speed,
    this.deg,
  });
  
  final double? speed;
  final double? deg;
  
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
  
}