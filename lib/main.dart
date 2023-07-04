import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/providers/weather_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) {
        return weatherProvider();
      },
      child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  WeatherApp({Key? key}) : super(key: key);
  weatherModel? weather;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch:
              Provider.of<weatherProvider>(context).weatherData == null
                  ? Colors.green
                  : Provider.of<weatherProvider>(context)
                      .weatherData!
                      .getTheamColor()),
      // theme: ThemeData(brightness: Brightness.dark),
      home: HomePage(),
    );
  }
}
