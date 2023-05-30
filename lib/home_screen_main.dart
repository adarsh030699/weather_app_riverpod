import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_riverpod/weather_home_page.dart';
import 'package:weather_app_riverpod/weather_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ref.read(weatherProvider).getGeolocatorPosition().then((value) {
      ref.read(weatherProvider).getCurrentWeather().then((value) {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => WeatherHomePage()));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("get.WEATHER"),
          Text("City?"),
        ],
      ),
    );
  }
}
