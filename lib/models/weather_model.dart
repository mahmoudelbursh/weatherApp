import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class weatherModel {
  String date;
  double temp;
  double maxTemp;
  double minTemp;

  String weatherStateName;

  weatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStateName});

  factory weatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    var jsonData1 = data['forecast']['forecastday'][1]['day'];

//  date = data['location']['localtime'];
//     temp = jsonData['avgtemp_c'];
//     maxTemp = jsonData['maxtemp_c'];
//     minTemp = jsonData['mintemp_c'];
//     weatherStateName = jsonData['condition']['text'];

    return weatherModel(
        date: data['location']['localtime'],
        temp: jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'],
        weatherStateName: jsonData['condition']['text']);
  }

  // @override
  // String toString() {
  //   return 'temp = $temp date = $date';
  // }

  String getImage() {
    if (weatherStateName == 'Thunderstorm')
      return 'assets / images / thunderstorm.png';
    else {
      return 'assets/images/cloudy.png';
    }
  }

  MaterialColor getTheamColor() {
    if (weatherStateName == 'Thunderstorm') {
      return Colors.blue;
      ;
    } else if (weatherStateName == 'clear') {
      return Colors.yellow;
    } else {
      return Colors.orange;
    }
  }
}
