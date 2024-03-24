import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app_bloc/models/weather_model.dart';
import 'package:weather_app_bloc/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());

  late WeatherModel weatherModel;

  Future<void> getWeather({required String cityName}) async {
    try {
      weatherModel = await WeatherService().getWeather(cityName: cityName);
      log(weatherModel.cityName.toString());
      emit(WeatherLoadedState());
    } on Exception {
      emit(WeatherFailureState());
    }
  }
}
