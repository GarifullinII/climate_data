import 'package:flutter/material.dart';
import '../components/rounded_button.dart';
import '../components/without_background_button.dart';
import '../utilities/constants.dart';

class CityScreen extends StatefulWidget {
  static const String id = 'city_screen';

  const CityScreen({super.key});

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  final cityTextController = TextEditingController();
  late String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: WithoutBackgroundButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icons.arrow_back_ios,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  autofocus: true,
                  controller: cityTextController,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  decoration: kTextFieldInputDecoration,
                  onChanged: (value) {
                    cityName = value;
                  },
                ),
              ),
              RoundedButton(
                color: Colors.blueAccent,
                title: 'Get Weather',
                onPressed: () {
                  cityTextController.clear();
                  Navigator.pop(context, cityName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
