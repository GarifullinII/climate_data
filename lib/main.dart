import 'package:climate_data/screens/city_screen.dart';
import 'package:climate_data/screens/loading_screen.dart';
import 'package:climate_data/screens/location_screen.dart';
import 'package:climate_data/screens/login_screen.dart';
import 'package:climate_data/screens/registration_screen.dart';
import 'package:climate_data/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ClimateData());
}

class ClimateData extends StatelessWidget {
  const ClimateData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black54),
        ),
      ),
      home: const WelcomeScreen(),
      initialRoute: 'welcome_screen',
      routes: {
        'welcome_screen': (context) => const WelcomeScreen(),
        'login_screen': (context) => const LoginScreen(),
        'registration_screen': (context) => const RegistrationScreen(),
        'loading_screen': (context) => const LoadingScreen(),
        'location_screen': (context) => const LocationScreen(),
        'city_screen': (context) => const CityScreen(),
      },
    );
  }
}