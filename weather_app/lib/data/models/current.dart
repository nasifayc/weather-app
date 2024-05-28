import 'package:weather_app/data/models/condition.dart';

class Current {
  double? tempCelsius;
  double? tempFahrenheit;
  int? isday;
  Condition? condition;
  double? windmph;
  double? windkph;
  int? humidity;

  Current({
    this.tempCelsius,
    this.tempFahrenheit,
    this.condition,
    this.isday,
    this.windmph,
    this.windkph,
    this.humidity,
  });

  Map<String, dynamic> toJson() {
    return {
      'tempCelsius': tempCelsius,
      'tempFahrenheit': tempFahrenheit,
      'isday': isday,
      'condition': condition!.toJson(),
      'windmph': windmph,
      'windkph': windkph,
      'humidity': humidity
    };
  }

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      tempCelsius: json['temp_c'],
      tempFahrenheit: json['temp_f'],
      isday: json['is_day'],
      condition: Condition.fromMap(json['condition']),
      windmph: json['wind_mph'],
      windkph: json['wind_kph'],
      humidity: json['humidity'],
    );
  }
}
