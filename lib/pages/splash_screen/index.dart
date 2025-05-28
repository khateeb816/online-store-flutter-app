import 'dart:async';

import 'package:flutter/material.dart';
import 'package:online_store/pages/auth/login.dart';
import 'package:online_store/pages/splash_screen/screen1.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static late SharedPreferences prefs;
  Future<void> getSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();
    navigateAfterDelay();
  }

  void navigateAfterDelay() async {
    await Future.delayed(Duration(seconds: 2));

    final prefs = await SharedPreferences.getInstance();
    print(prefs.getBool('first_login'));

    if (prefs.getBool('first_login') == null || prefs.getBool('first_login') == false) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Screen1()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }
  }


  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
              child: Image(image: AssetImage("assets/images/logo.png")),
            ),
            SizedBox(width: 10),
            Text(
              "Stylish",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color(0xFFEF5434),
                fontFamily: "LibreCaslonText-Bold",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
