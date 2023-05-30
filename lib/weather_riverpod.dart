import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

import 'package:weather_app_riverpod/http_weather_service.dart';

class WeatherRiverpod extends ChangeNotifier {
  Position? _position;

  bool _loader = false;

  String? _weather;

  double? _temprature;

  int? _pressure;
  double? _windspeed;
  int? _humidity;

  Position? get position => _position;

  bool get loader => _loader;

  String? get weather => _weather;

  double? get temprature => _temprature;
  int? get humidity => _humidity;

  int? get pressure => _pressure;

  double? get windspeed => _windspeed;

  Future<void> getGeolocatorPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    _position = await Geolocator.getCurrentPosition();
  }

  Future getCurrentWeather() async {
    final weatherService = WeatherService();

    final response = await weatherService.getWeather(city: 'pune');

    final parsedData = jsonDecode(response.body);

    _weather = parsedData["weather"][0]["main"];
    _temprature = parsedData['main']["temp"];
    _humidity = parsedData["main"]["humidity"];
    _pressure = parsedData["main"]["pressure"];
    _windspeed = parsedData["wind"]["speed"];

    log(response.body);
  }

  String Time() {
    String timeData = DateFormat("hh:mm a,").format(DateTime.now());

    return timeData;
  }

  String Date() {
    String dateData = DateFormat("dd MMMM, yyyy").format(DateTime.now());

    return dateData;
  }

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12 && hour >= 6) {
      return 'Morning';
    }
    if (hour < 17 && hour >= 12) {
      return 'Afternoon';
    }
    if (hour < 20 && hour >= 17) {
      return 'Evening';
    } else {
      return "Night";
    }
  }
}

final weatherProvider = ChangeNotifierProvider((ref) => WeatherRiverpod());
