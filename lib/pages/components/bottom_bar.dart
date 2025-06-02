import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_store/pages/home/index.dart';
import 'package:online_store/pages/search_product/index.dart';

Stack bottomBar(BuildContext context, String active) {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Container(
        padding: EdgeInsets.only(top: 15),
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Color(0xFFE1E1E1), width: 1.5)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Home
            InkWell(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.home_outlined,
                    size: 30,
                    color: active == "home" ? Colors.red : Colors.black,
                  ),
                  Text(
                    "Home",
                    style: TextStyle(
                      fontFamily: "Roboto-Medium",
                      fontSize: 12,
                      color: active == "home" ? Colors.red : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            //Wishlist
            InkWell(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              ),
              child: Column(
                children: [
                  Icon(
                    FontAwesomeIcons.heart,
                    size: 28,
                    color: active == "wishlist" ? Colors.red : Colors.black,
                  ),
                  Text(
                    "Wishlist",
                    style: TextStyle(
                      fontFamily: "Roboto-Medium",
                      fontSize: 12,
                      color: active == "wishlist" ? Colors.red : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 50),
            //Search
            InkWell(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SearchProductPage()),
              ),
              child: Column(
                children: [
                  Icon(
                    FontAwesomeIcons.magnifyingGlass,
                    size: 28,
                    color: active == "search" ? Colors.red : Colors.black,
                  ),
                  Text(
                    "Search",
                    style: TextStyle(
                      fontFamily: "Roboto-Medium",
                      fontSize: 12,
                      color: active == "search" ? Colors.red : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            //Setting
            InkWell(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              ),
              child: Column(
                children: [
                  Icon(
                    FontAwesomeIcons.gear,
                    size: 28,
                    color: active == "setting" ? Colors.red : Colors.black,
                  ),
                  Text(
                    "Setting",
                    style: TextStyle(
                      fontFamily: "Roboto-Medium",
                      fontSize: 12,
                      color: active == "setting" ? Colors.red : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Positioned(
        top: -10,
        left: MediaQuery.of(context).size.width / 2 - 30,
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Color(0xFFFDFDFD),
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Color(0xFFE1E1E1),
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Icon(FontAwesomeIcons.cartShopping),
        ),
      ),
    ],
  );
}
