import 'package:flutter/material.dart';
import 'package:online_store/pages/auth/login.dart';
import 'package:online_store/pages/splash_screen/screen1.dart';
import 'package:online_store/pages/splash_screen/screen2.dart';

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage("assets/images/splash_screen_3.png")),
              Text(
                "Get Your Order",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Montserrat-ExtraBold",
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0 , vertical: 10),
                child: Text(
                  "Amet minim mollit non deserunt ullamco est\n sit aliqua dolor do amet sint. Velit officia\n consequat duis enim velit mollit.",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Montserrat-SemiBold",
                    color: Color(0xFFA5A5A6),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 50,)
            ],
          ),
        ),
        bottomNavigationBar:SizedBox(
          height: 70,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Screen2()));
                }, child: Text("Prev" , style: TextStyle(fontSize: 18, fontFamily: "Montserrat-SemiBold", color: Color(
                    0xFFC3C3C3)),)),
                Row(
                  children: [
                    ImageIcon(AssetImage('assets/images/circle.png') , size: 30,),
                    ImageIcon(AssetImage('assets/images/circle.png') , size: 30,),
                    ImageIcon(AssetImage('assets/images/ovel.png') , size: 35,),

                  ],
                ),
                TextButton(onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));

                }, child: Text("Get Started" , style: TextStyle(fontSize: 18, fontFamily: "Montserrat-SemiBold", color: Color(0xFFEF5434)),))
              ],
            ),
          ),
        )
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "3",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Montserrat-SemiBold",
                  color: Color(0xFF303030),
                ),
              ),

              Text(
                "/3",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Montserrat-SemiBold",
                  color: Color(0xFFA5A5A6),
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "Skip",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: "Montserrat-SemiBold",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
