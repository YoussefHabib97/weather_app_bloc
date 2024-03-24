import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app_bloc/services/weather_service.dart';
import 'package:weather_app_bloc/views/home_view.dart';

void main() {
  WeatherService().getWeather(cityName: 'cairo');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeView(),
      ),
    );
  }
}
