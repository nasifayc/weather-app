import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/data/data_providers/services/search_weather.dart';
import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/presentation/widgets/toast.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit()
      : super(WeatherState(
            weather: WeatherModel(), isLoading: false, hasData: false));
  final WeatherService _service = WeatherService();

  Future<void> searchWeatherData(String city) async {
    String url =
        'http://api.weatherapi.com/v1/current.json?key=9516543878a647e592e174619242705&q=$city&aqi=no';
    emit(
        WeatherState(weather: WeatherModel(), isLoading: true, hasData: false));
    try {
      Map<String, dynamic>? result = await _service.searchWeather(url);
      if (result != null) {
        WeatherModel weatherModel = WeatherModel.fromJson(result);

        return emit(WeatherState(
            weather: weatherModel, isLoading: false, hasData: true));
      } else {
        showToast(message: 'Error: Result is Null');
        return emit(WeatherState(
            weather: WeatherModel(), isLoading: false, hasData: false));
      }
    } catch (e) {
      showToast(message: 'Error at cubit: $e');
      emit(WeatherState(
          weather: WeatherModel(), isLoading: false, hasData: false));
    }
  }
}
