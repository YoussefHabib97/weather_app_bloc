import 'package:flutter/material.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Column(
            children: [
              Text('Cairo'),
              Text('Updated at: 00:00:00'),
            ],
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/clear.png'),
              const SizedBox(width: 32),
              const Text('Hello World!'),
              const SizedBox(width: 32),
              const Column(
                children: [
                  Text('Min Temp: '),
                  Text('Max Temp: '),
                ],
              ),
            ],
          ),
          const SizedBox(height: 32),
          const Text("Light Rain"),
        ],
      ),
    );
  }
}
