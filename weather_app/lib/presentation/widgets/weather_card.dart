import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/business_logic/cubits/cubit/weather_cubit.dart';
import 'package:weather_app/presentation/helpers/formatter.dart';
import 'package:weather_app/presentation/widgets/styled_text.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(
              colors: [Colors.blue, Color.fromARGB(255, 82, 168, 238)])),
      child: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoadded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    const Icon(
                      Icons.location_city,
                      color: Colors.white,
                      size: 40,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    StyledText(
                      value: state.weather.location!.name!,
                      color: Colors.white,
                      isBold: true,
                      fontSize: 30,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StyledText(
                          value: state.weather.location!.region!,
                          color: Colors.white,
                          isBold: false,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        StyledText(
                          value: state.weather.location!.country!,
                          color: Colors.white,
                          isBold: true,
                        ),
                      ],
                    ),
                    StyledText(
                      value: Formatter.formatTemperature(
                          state.weather.current!.tempCelsius!),
                      color: Colors.white,
                      isBold: true,
                      fontSize: 40,
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 40,
                        backgroundImage: NetworkImage(
                          state.weather.current!.condition!.icon!,
                        ),
                      ),
                      StyledText(
                        value: state.weather.current!.condition!.text!,
                        color: Colors.white,
                        isBold: true,
                        fontSize: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              const StyledText(
                                  value: 'Wind',
                                  color: Colors.white,
                                  isBold: false),
                              StyledText(
                                  value:
                                      '${state.weather.current!.windkph} kph',
                                  color: Colors.white,
                                  isBold: false)
                            ],
                          ),
                          Column(
                            children: [
                              const StyledText(
                                  value: 'Humidity',
                                  color: Colors.white,
                                  isBold: false),
                              StyledText(
                                  value: '${state.weather.current!.humidity}%',
                                  color: Colors.white,
                                  isBold: false)
                            ],
                          ),
                          Column(
                            children: [
                              const StyledText(
                                  value: 'Status',
                                  color: Colors.white,
                                  isBold: false),
                              StyledText(
                                  value: state.weather.current!.isday == 1
                                      ? 'day'
                                      : 'night',
                                  color: Colors.white,
                                  isBold: false)
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            );
          } else if (state is WeatherLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherEmpty) {
            return const Center(
              child: Text('Search for Locations'),
            );
          } else if (state is WeatherError) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          }
        },
      ),
    );
  }
}
