import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app_bloc/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app_bloc/views/search_view.dart';
import 'package:weather_app_bloc/widgets/no_weather_body.dart';
import 'package:weather_app_bloc/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const SearchView();
                  },
                ),
              );
            },
            icon: const Icon(Icons.search_outlined),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          // if (state is WeatherInitialState) {
          //   return const NoWeatherBody();
          // } else if (state is WeatherLoadedState) {
          //   return const WeatherInfoBody();
          // } else {
          //   return const Center(
          //     child: Text("Oops! There was an error.\nPlease try again later."),
          //   );
          // }

          switch (state) {
            case WeatherInitialState():
              return const NoWeatherBody();
            case WeatherLoadedState():
              return const WeatherInfoBody();
            case WeatherFailureState():
              return const Center(
                child: Text("There was an error loading data."),
              );
          }
          return const Center(
            child: Text("Oops! There was an error.\nPlease try again later."),
          );
        },
      ),
    );
  }
}

// BLoC Pattern:
// 1. Create States
// 2. Create Cubit
// 3. Create Function
// 4. Provide Cubit
// 5. Integrate Cubit
// 6. Trigger Cubit