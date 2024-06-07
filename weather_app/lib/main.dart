import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/business_logic/cubits/cubit/connectivity_cubit.dart';
import 'package:weather_app/business_logic/cubits/cubit/weather_cubit.dart';
import 'package:weather_app/presentation/screens/home.dart';
// for api request
// http://api.weatherapi.com/v1/current.json?key=9516543878a647e592e174619242705&q=London&aqi=no

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ConnectivityCubit(),
        ),
        BlocProvider(
          create: (context) => WeatherCubit(context.read<ConnectivityCubit>()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'weather app',
        theme: ThemeData(primaryColor: Colors.blue),
        home: const HomePage(),
      ),
    );
  }
}
