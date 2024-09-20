import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'reportpage.dart';  // Import the new ReportPage

class SplashScreen extends StatefulWidget {
  final double bmi;
  final String gender;

  SplashScreen({required this.bmi, required this.gender});  // Add parameters for BMI and gender

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ReportPage(
            bmi: widget.bmi,
            gender: widget.gender,
          ),  // Pass BMI and gender to ReportPage
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,  // Background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 4,  // Adjust the flex value to manage space usage
              child: Lottie.asset(
                'assests/Animation - 1726594537269.json',
                fit: BoxFit.contain,  // Ensure the animation fits within its container
              ),
            ),
            SizedBox(height: 20),
            Flexible(
              flex: 2,  // Adjust the flex value to manage space usage
              child: Lottie.asset(
                'assests/Animation - 1726594672506.json',
                fit: BoxFit.contain,  // Ensure the animation fits within its container
              ),
            ),
          ],
        ),
      ),
    );
  }
}
