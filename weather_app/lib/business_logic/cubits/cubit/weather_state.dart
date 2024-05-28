part of 'weather_cubit.dart';

class WeatherState {
  final WeatherModel weather;
  final bool isLoading;
  final bool hasData;

  WeatherState(
      {required this.weather, required this.isLoading, required this.hasData});
}
