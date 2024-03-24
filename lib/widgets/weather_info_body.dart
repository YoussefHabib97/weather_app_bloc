import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/cubits/get_weather_cubit/get_weather_cubit.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
    final weatherModel = getWeatherCubit.weatherModel;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            children: [
              Text(weatherModel.cityName),
              Text(weatherModel.date),
            ],
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 64,
                height: 64,
                child: Image.network(weatherModel.image),
              ),
              const SizedBox(width: 32),
              const Text('Hello World!'),
              const SizedBox(width: 32),
              Column(
                children: [
                  Text('Min Temp: ${weatherModel.minTemp}℃'),
                  Text('Max Temp: ${weatherModel.maxTemp}℃'),
                ],
              ),
            ],
          ),
          const SizedBox(height: 32),
          Text(weatherModel.weatherCondition),
        ],
      ),
    );
  }
}
