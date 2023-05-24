import 'package:http/http.dart' as http;

import 'constant.dart';

class WeatherService {
  Future<http.Response> getWeather(
      {required double lat, required double long}) async {
    final urlkey =
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apiKey';

    final uri = Uri.parse(urlkey);

    http.Response response = await http.get(uri);

    return response;
  }
}
