import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
Stack bottomBar(BuildContext context) {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Container(
        padding: EdgeInsets.only(top: 15),
        height: 85,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Color(0xFFE1E1E1), width: 1.5),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(children: [Icon(Icons.home_outlined , size: 32, color: Colors.red,), Text("Home" , style: TextStyle(fontFamily: "Roboto-Medium" , fontSize: 12 , color: Colors.red),)]),
            Column(
              children: [Icon(FontAwesomeIcons.heart , size: 30), Text("Wishlist")],
            ),
            SizedBox(width: 50),
            Column(
              children: [
                Icon(FontAwesomeIcons.magnifyingGlass , size: 30),
                Text("Search"),
              ],
            ),
            Column(
              children: [Icon(FontAwesomeIcons.gear, size: 30,), Text("Setting")],
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