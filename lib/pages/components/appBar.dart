import 'package:flutter/material.dart';

AppBar buildAppBar() {
  return AppBar(
    shadowColor: Colors.transparent,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ImageIcon(AssetImage('assets/images/hamburger.png')),
        Image.asset('assets/images/logo2.png'),
        CircleAvatar(backgroundImage: AssetImage('assets/images/user.png')),
      ],
    ),
    elevation: 0,
    backgroundColor: Color(0xFFF7F7F7),
  );
}
