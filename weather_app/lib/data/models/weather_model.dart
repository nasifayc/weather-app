import 'package:weather_app/data/models/current.dart';
import 'package:weather_app/data/models/location.dart';

class WeatherModel {
  final Location location;
  final Current current;

  WeatherModel({
    required this.location,
    required this.current,
  });

  Map<String, dynamic> toJson() {
    return {
      'location': location.toJson(),
      'current': current.toJson(),
    };
  }

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
        location: Location.fromJson(json['location']),
        current: Current.fromJson(json['current']));
  }
}
