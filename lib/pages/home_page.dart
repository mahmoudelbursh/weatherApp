import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_services.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void updateUi() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var weatherData = Provider.of<weatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return searchPage(
                    updateUi: updateUi,
                  );
                }));
              },
              icon: Icon(Icons.search))
        ],
        title: Text('Weather App'),
      ),
      body: weatherData == null
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'there is no weather 😔 start',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'searching now 🔍',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )
                ],
              ),
            )
          : Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                weatherData!.getTheamColor(),
                weatherData!.getTheamColor()[100]!,
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(
                    flex: 3,
                  ),
                  Text(
                    Provider.of<weatherProvider>(context).cityName ??
                        'ادخل المدينة',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'updated : ${weatherData.date}',
                    style: TextStyle(fontSize: 22),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(weatherData!.getImage()),
                      Column(
                        children: [
                          Text(
                            'Today:' + weatherData!.temp.toInt().toString(),
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                          Text(
                            'The next day:' +
                                weatherData!.minTemp.toInt().toString(),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                          Text(
                            'The next day:' + weatherData!.minTemp.toString(),
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w300),
                          ),
                          Text(
                            'The next day:' +
                                weatherData!.maxTemp.toInt().toString(),
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w200),
                          ),
                          Text(
                            'The next day:' + weatherData!.maxTemp.toString(),
                            style: TextStyle(
                                fontSize: 8, fontWeight: FontWeight.w100),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'maxTemp: ${weatherData!.maxTemp.toDouble()}',
                          ),
                          Text(
                            'minTemp: ${weatherData.minTemp.toDouble()}',
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Text(
                    weatherData!.weatherStateName ?? '-.-',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Spacer(
                    flex: 6,
                  ),
                ],
              ),
            ),
    );
  }
}
