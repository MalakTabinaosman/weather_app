import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInformation extends StatelessWidget {
  const WeatherInformation({super.key, required this.weatherModel});
  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            weatherModel.cityName,
            style: TextStyle(fontSize: 40),
          ),
          Text(
            weatherModel.date,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 50,
                child: Image.network("https:${weatherModel.cityImage}"),
              ),
              SizedBox(
                width: 50,
              ),
              Text(
                weatherModel.temp,
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(
                width: 50,
              ),
              Column(
                children: [
                  Text(
                    "MaxTemp:${weatherModel.maxTemp}",
                    style: TextStyle(fontSize: 15),
                  ),
                  Text("MinTemp:${weatherModel.minTemp}",
                      style: TextStyle(fontSize: 15)),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            weatherModel.weatherCondition,
            style: TextStyle(fontSize: 25),
          ),
        ],
      ),
    );
  }
}
