import 'package:climate_data/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:climate_data/screens/location_screen.dart';

import '../utilities/constants.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void _getLocationData() async {
    dynamic weatherData = await WeatherModel().getLocationWeather();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(
            locationWeather: weatherData,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _getLocationData();
          },
          child: const Text(
            'get weather',
            style: kButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
