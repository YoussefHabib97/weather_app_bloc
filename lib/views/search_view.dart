import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:weather_app_bloc/models/weather_model.dart';
import 'package:weather_app_bloc/services/weather_service.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search for a City"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
          child: TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              label: Text("Search"),
              hintText: "Enter City Name",
              suffixIcon: Icon(
                (Icons.search_outlined),
              ),
            ),
            onSubmitted: (value) async {
              if (value.trim().isNotEmpty) {
                try {
                  WeatherModel weatherModel =
                      await WeatherService().getWeather(cityName: value.trim());
                  log(weatherModel.cityName.toString());
                } on Exception {
                  rethrow;
                }
              }
            },
          ),
        ),
      ),
    );
  }
}
