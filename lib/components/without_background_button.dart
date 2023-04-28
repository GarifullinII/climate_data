import 'package:flutter/material.dart';

class WithoutBackgroundButton extends StatelessWidget {
  const WithoutBackgroundButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: MaterialButton(
        onPressed: onPressed,
        child: Icon(
          icon,
          size: 25.0,
          color: Colors.white,
        ),
      ),
    );
  }
}