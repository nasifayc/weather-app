import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/business_logic/cubits/cubit/weather_cubit.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(
              colors: [Colors.blue, Color.fromARGB(255, 82, 168, 238)])),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state.hasData) {
              // Debugging URL
              print(
                  'Weather icon URL: ${state.weather.current!.condition!.icon!}');

              return Column(
                children: <Widget>[
                  Text(
                    state.weather.location!.name!,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    state.weather.location!.region!,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    state.weather.location!.country!,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.network(
                        state.weather.current!.condition!.icon!,
                        errorBuilder: (context, error, stackTrace) {
                          print('Failed to load image: $error');
                          return Icon(Icons.error, size: 50, color: Colors.red);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    state.weather.current!.condition!.text!,
                  ),
                ],
              );
            } else if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return const Center(
                child: Text('No Data Available'),
              );
            }
          },
        ),
      ),
    );
  }
}
