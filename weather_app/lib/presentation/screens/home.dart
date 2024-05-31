import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/business_logic/cubits/cubit/weather_cubit.dart';
import 'package:weather_app/presentation/widgets/toast.dart';
import 'package:weather_app/presentation/widgets/weather_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                  hintText: 'Serach',
                  suffixIcon: GestureDetector(
                      onTap: () async {
                        try {
                          if (_controller.text.isNotEmpty) {
                            await BlocProvider.of<WeatherCubit>(context)
                                .searchWeatherData(_controller.text.trim());
                          } else {
                            showToast(message: 'Empty data');
                            return;
                          }
                        } catch (e) {
                          showToast(message: e.toString());
                        }
                      },
                      child: const Icon(Icons.search)),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
            ),
            const SizedBox(
              height: 40,
            ),
            const Center(
              child: WeatherCard(),
            )
          ],
        ),
      ),
    );
  }
}
