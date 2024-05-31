part of 'weather_cubit.dart';

class WeatherState extends Equatable {
  final WeatherModel weather;
  final bool isLoading;
  final bool hasData;

  WeatherState(
      {required this.weather, required this.isLoading, required this.hasData});

  @override
  // TODO: implement props
  List<Object?> get props => [weather, isLoading, hasData];
}
