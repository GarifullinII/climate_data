import 'package:climate_data/screens/city_screen.dart';
import 'package:climate_data/screens/loading_screen.dart';
import 'package:climate_data/screens/location_screen.dart';
import 'package:climate_data/screens/login_screen.dart';
import 'package:climate_data/screens/registration_screen.dart';
import 'package:climate_data/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const ClimateData());
}

class ClimateData extends StatelessWidget {
  const ClimateData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const WelcomeScreen(),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        RegistrationScreen.id: (context) => const RegistrationScreen(),
        LoadingScreen.id: (context) => const LoadingScreen(),
        LocationScreen.id: (context) => const LocationScreen(),
        CityScreen.id: (context) => const CityScreen(),
      },
    );
  }
}
