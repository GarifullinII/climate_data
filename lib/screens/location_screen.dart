import 'package:climate_data/services/weather.dart';
import 'package:flutter/material.dart';
import '../components/without_background_button.dart';
import '../utilities/constants.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  static const String id = 'location_screen';

  const LocationScreen({super.key, this.locationWeather});

  final dynamic locationWeather;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  late int temperature;
  late String weatherIcon;
  late String message;
  late String cityName;

  @override
  void initState() {
    super.initState();

    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(
      () {
        if (weatherData == null) {
          temperature = 0;
          weatherIcon = 'Error';
          message = 'Unable to get weather data';
          cityName = 'No city';
          return;
        }

        double temp = weatherData['main']['temp'];
        temperature = temp.toInt();
        var condition = weatherData['weather'][0]['id'];
        weatherIcon = weather.getWeatherIcon(condition);
        message = weather.getMessage(temperature);
        cityName = weatherData['name'];
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.8),
              BlendMode.dstATop,
            ),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WithoutBackgroundButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icons.arrow_back_ios,
                  ),
                  WithoutBackgroundButton(
                    onPressed: () async {
                      var weatherData = await weather.getLocationWeather();
                      updateUI(weatherData);
                    },
                    icon: Icons.near_me,
                  ),
                  WithoutBackgroundButton(
                    onPressed: () async {
                      var typeName =
                          await Navigator.pushNamed(context, CityScreen.id);

                      if (typeName != null) {
                        var weatherData =
                            await weather.getCityWeather(typeName.toString());
                        updateUI(weatherData);
                      }
                    },
                    icon: Icons.location_city,
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        '$temperature°',
                        style: kTempTextStyle,
                      ),
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    '$message in $cityName',
                    textAlign: TextAlign.right,
                    style: kMessageTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// onPressed: () {
// Navigator.pop(context);
// },
// child: const Icon(
// Icons.arrow_back_ios,
