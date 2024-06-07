part of 'weather_cubit.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object?> get props => [];
}

class WeatherLoading extends WeatherState {}

class WeatherLoadded extends WeatherState {
  final WeatherModel weather;
  const WeatherLoadded({required this.weather});

  @override
  List<Object?> get props => [weather];
}

class WeatherEmpty extends WeatherState {}

class WeatherError extends WeatherState {
  final String message;

  const WeatherError({required this.message});
  @override
  List<Object?> get props => [message];
}

// class WeatherState extends Equatable {
//   final WeatherModel weather;
//   final bool isLoading;
//   final bool hasData;

//   const WeatherState(
//       {required this.weather, required this.isLoading, required this.hasData});

//   @override
//   // TODO: implement props
//   List<Object?> get props => [weather, isLoading, hasData];
// }
