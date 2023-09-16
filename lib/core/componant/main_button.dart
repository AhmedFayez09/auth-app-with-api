import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  MainButton({
    super.key,
    required this.text,
    required this.onPress,
  });
  String text;
  VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(
          horizontal: 50,
          vertical: 15,
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}
