import 'package:flutter/material.dart';
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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
