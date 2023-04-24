import 'package:flutter/material.dart';
import 'package:climate_data/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void _getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  void getData() async {
    http.Response response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=5f24b480465f1f9fbe5c3bedfcead602'));

    if (response.statusCode == 200) {
      String data = response.body;
      print(data);

      var longitude = jsonDecode(data)['coord']['lon'];
      print(longitude);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // _getLocation();
            getData();
          },
          child: const Text('GET LOCATION'),
        ),
      ),
    );
  }
}
