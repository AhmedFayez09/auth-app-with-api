import 'package:flutter/material.dart';

class FaceAndGoogleButtons extends StatelessWidget {
  const FaceAndGoogleButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.grey.withOpacity(0.7),
            ),
          ),
          child: Image.asset("assets/images/google.png"),
        ),
        SizedBox(width: 10),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.grey.withOpacity(0.7),
            ),
          ),
          child: Image.asset("assets/images/apple.png"),
        ),
        SizedBox(width: 10),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.grey.withOpacity(0.7),
            ),
          ),
          child: Image.asset(
            "assets/images/facebook.png",
            width: 20,
            height: 20,
          ),
        ),
      ],
    );
  }
}
