import 'dart:async';

import 'package:flutter/material.dart';
import 'package:online_store/pages/splash_screen/screen1.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 2), () {
      if(true){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Screen1()));
      }
    });
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
            SizedBox(width: 10,),
            Text("Stylish" , style: TextStyle(fontSize: 40 , fontWeight: FontWeight.bold,color: Color(
                0xFFEF5434),fontFamily: "LibreCaslonText-Bold"), ),
          ],
        ),
      ),
    );
  }
}
