import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class weatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '0ca471707b96441890a31159232703';
  //
  Future<weatherModel> getWeather({required String cityName}) async {
    //
    Uri url =
        Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
    http.Response response = await http.get(url);
    //
    Map<String, dynamic> data = jsonDecode(response.body);

    weatherModel weather = weatherModel.fromJson(data);

    return weather;
  }
}
