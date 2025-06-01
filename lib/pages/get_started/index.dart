import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_store/pages/home/index.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(systemNavigationBarColor: Colors.black),
    );
    return Scaffold(
      body: Stack(
        children: [
          //Image
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image(
              image: AssetImage("assets/images/get_started.png"),
              fit: BoxFit.fill,
            ),
          ),
          //Linear Gradient
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xCD000000),
                  Color(0x94000000),
                  Color(0x00f63758),
                  Color(0x00f63758),
                ],
                begin: FractionalOffset.bottomCenter,
                end: FractionalOffset.topCenter,
              ),
            ),
          ),
          //Content
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //Text
              SizedBox(
                width: double.infinity,
                child: Text(
                  "You want\nAuthentic, here\nyou go!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Montserrat-SemiBold",
                    fontSize: 34,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 15),
              //Light Text
              SizedBox(
                width: double.infinity,
                child: Text(
                  "Find it here, buy it now!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: "Montserrat-Regular",
                    color: Color(0xFFF2F2F2),
                  ),
                ),
              ),
              SizedBox(height: 40),
              // Button
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 60),
                decoration: BoxDecoration(
                  color: Color(0xFFF63758),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontFamily: "Montserrat-SemiBold",
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ],
      ),
    );
  }
}
