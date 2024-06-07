import 'package:equatable/equatable.dart';
import 'package:weather_app/data/models/current.dart';
import 'package:weather_app/data/models/location.dart';

class WeatherModel extends Equatable {
  Location? location;
  Current? current;

  WeatherModel({
    this.location,
    this.current,
  });

  Map<String, dynamic> toJson() {
    return {
      'location': location!.toJson(),
      'current': current!.toJson(),
    };
  }

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
        location: Location.fromJson(json['location']),
        current: Current.fromJson(json['current']));
  }

  @override
  List<Object?> get props => [location, current];
}
