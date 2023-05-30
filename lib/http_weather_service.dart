import 'package:http/http.dart' as http;

import 'constant.dart';

class WeatherService {
  Future<http.Response> getWeather({required String city}) async {
    final urlkey =
        'http://api.openweathermap.org/data/2.5/weather?q=$city&units=metric&appid=$apiKey';

    final uri = Uri.parse(urlkey);

    http.Response response = await http.get(uri);

    return response;
  }
}
