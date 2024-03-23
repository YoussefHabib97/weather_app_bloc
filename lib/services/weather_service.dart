import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather_app_bloc/models/weather_model.dart';

const String baseUrl = 'https://api.weatherapi.com/v1';
const String apiKey = '62740f731a3a490780d145415242303';

class WeatherService {
  final dio = Dio();

  Future<WeatherModel> getWeather({required String cityName}) async {
    try {
      final response = await dio.get(
        '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1&aqi=no&alerts=no',
      );

      final weatherModel = WeatherModel.fromJson(response.data);

      log(weatherModel.toString());

      return weatherModel;
    } on DioException catch (e) {
      final String errMessage = e.response?.data['error']['message'] ??
          "Oops! There was an error.\nPlease try again later.";
      throw Exception(errMessage);
    } catch (e) {
      log(e.toString());
      throw Exception("Oops! There was an error.\nPlease try again later.");
    }
  }
}
