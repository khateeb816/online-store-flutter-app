import 'package:flutter/material.dart';

Widget buildSearchBar() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),

    child: TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        prefixIcon: Icon(Icons.search),
        suffixIcon: Icon(Icons.mic_none),
        filled: true,
        hintText: 'Search any Product',
        hintStyle: TextStyle(
          color: Color(0xFFBBBBBB),
          fontFamily: "Montserrat-Regular",
          fontSize: 14,
        ),
        fillColor: Color(0xFFFDFDFD),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  );
}
