import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:snackbar/snackbar.dart';

import 'package:weather_app/models/weather_model.dart';
//import 'package:weather_app/pages/snackbar.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_services.dart';

class searchPage extends StatefulWidget {
  searchPage({this.updateUi});
  VoidCallback? updateUi;

  @override
  State<searchPage> createState() => _searchPageState();
}

class _searchPageState extends State<searchPage> {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search a City')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  onChanged: (data) {
                    cityName = data;
                  },
                  onSubmitted: (data) async {
                    try {
                      cityName = data;
                      weatherService service = weatherService();
                      weatherModel weather =
                          await service.getWeather(cityName: cityName!);
                      // print(weather);
                      // weatherData = weather;
                      Provider.of<weatherProvider>(context, listen: false)
                          .weatherData = weather;
                      Provider.of<weatherProvider>(context, listen: false)
                          .cityName = cityName;

                      Navigator.pop(context);
                    } catch (e) {
                      final snackBar = SnackBar(
                          content:
                              Text('ERROR , check your internet or cuntry!'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                    label: Text('Search ex: london'),
                    suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () async {
                          // cityName = data;
                          try {
                            weatherService service = weatherService();
                            weatherModel weather =
                                await service.getWeather(cityName: cityName!);

                            Provider.of<weatherProvider>(context, listen: false)
                                .weatherData = weather;
                            Provider.of<weatherProvider>(context, listen: false)
                                .cityName = cityName;

                            Navigator.pop(context);
                          } catch (e) {
                            final snackBar = SnackBar(
                                content: Text(
                                    'ERROR , check your internet or cuntry'));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        }),
                    border: OutlineInputBorder(),
                    hintText: 'Enter City ex: london',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //   TextField(
                //     onChanged: (value) {
                //       //Do something with the user input.
                //     },
                //     decoration: InputDecoration(
                //       hintText: 'Enter your CITY by map.',
                //       contentPadding:
                //           EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                //       border: OutlineInputBorder(
                //         borderRadius: BorderRadius.all(Radius.circular(32.0)),
                //       ),
                //       enabledBorder: OutlineInputBorder(
                //         borderSide:
                //             BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                //         borderRadius: BorderRadius.all(Radius.circular(32.0)),
                //       ),
                //       focusedBorder: OutlineInputBorder(
                //         borderSide:
                //             BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                //         borderRadius: BorderRadius.all(Radius.circular(32.0)),
                //       ),
                //     ),
                //   ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
