import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/business_logic/cubits/cubit/connectivity_cubit.dart';
import 'package:weather_app/data/data_providers/services/search_weather.dart';
import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/presentation/widgets/toast.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final ConnectivityCubit connectivityCubit;
  late final StreamSubscription connectivitySubscription;

  final WeatherService _service = WeatherService();

  WeatherCubit(this.connectivityCubit) : super(WeatherEmpty()) {
    connectivitySubscription =
        connectivityCubit.stream.listen((connectivityState) {
      if (connectivityState is ConnectivityDisconnected) {
        emit(const WeatherError(message: 'No Internet connection'));
      } else {
        emit(WeatherEmpty());
      }
    });
  }

  Future<void> searchWeatherData(String city) async {
    if (connectivityCubit.state is ConnectivityDisconnected) {
      emit(const WeatherError(message: 'No Internet connection'));
      return;
    }

    String url =
        'http://api.weatherapi.com/v1/current.json?key=9516543878a647e592e174619242705&q=$city&aqi=no';
    emit(WeatherLoading());
    try {
      Map<String, dynamic>? result = await _service.searchWeather(url);
      if (result != null) {
        WeatherModel weatherModel = WeatherModel.fromJson(result);
        return emit(WeatherLoadded(weather: weatherModel));
      } else {
        showToast(message: 'Error: Result is Null');
        return emit(const WeatherError(message: "Can't find data"));
      }
    } catch (e) {
      showToast(message: 'Error at cubit: $e');
      emit(const WeatherError(message: "Can't find data"));
    }
  }

  @override
  Future<void> close() {
    connectivityCubit.close();
    connectivitySubscription.cancel();
    return super.close();
  }
}
