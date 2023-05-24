import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_riverpod/weather_riverpod.dart';

class WeatherHomePage extends ConsumerWidget {
  const WeatherHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherNotifier = ref.watch(weatherProvider);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () async {
                  await weatherNotifier.getGeolocatorPosition();
                  await weatherNotifier.getCurrentWeather();
                },
                child: weatherNotifier.loader
                    ? Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : Text("get weather data")),
          ),
          weatherNotifier.weather != null
              ? Column(
                  children: [
                    Text("weather :${weatherNotifier.weather!}"),
                    Text("temprature :${weatherNotifier.temprature!}")
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
