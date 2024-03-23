import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather_app_bloc/models/weather_model.dart';

const apiKey = '62740f731a3a490780d145415242303';

class WeatherService {
  final dio = Dio();

  Future<WeatherModel> getWeather({required String cityName}) async {
    final response = await dio.get(
      'https://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$cityName&days=1&aqi=no&alerts=no',
    );

    final weatherModel = WeatherModel.fromJson(response.data);

    log(weatherModel.toString());

    return weatherModel;
  }
}
