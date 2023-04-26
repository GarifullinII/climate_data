import 'package:climate_data/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:climate_data/screens/location_screen.dart';
import '../utilities/constants.dart';

class LoadingScreen extends StatefulWidget {
  static String id = 'loading_screen';

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
      // backgroundColor: Colors.white,
      body: Center(
        child: MaterialButton(
          onPressed: () {
            _getLocationData();
          },
          minWidth: 200.0,
          height: 42.0,
          child: const Text(
            'Get Weather',
            style: kButtonTextStyle,
          ),
        ),
      ),
    );
  }
}