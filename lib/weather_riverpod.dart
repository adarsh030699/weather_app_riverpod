import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

import 'package:weather_app_riverpod/http_weather_service.dart';

class WeatherRiverpod extends ChangeNotifier {
  Position? _position;

  bool _loader = false;

  String? _weather;

  double? _temprature;

  double _latitude = 0.0;
  double _longitude = 0.0;

  Position? get position => _position;

  bool get loader => _loader;

  String? get weather => _weather;

  double? get temprature => _temprature;



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
    _latitude = position!.latitude;
    _longitude = position!.longitude;

  }

  Future getCurrentWeather() async {
    final weatherService = WeatherService();

    final response =
        await weatherService.getWeather(lat: _latitude, long: _longitude);

    final parsedData = jsonDecode(response.body);

    _weather = parsedData["weather"][0]["main"];
    _temprature = parsedData['main']["temp"];
    
  }
}

final weatherProvider = ChangeNotifierProvider((ref) => WeatherRiverpod());
