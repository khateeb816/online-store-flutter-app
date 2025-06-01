import 'dart:math';
import 'package:flutter/material.dart';

Widget buildFilterBar(String title){
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontFamily: "Montserrat-SemiBold", fontSize: 18),
        ),
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              height: 24,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0xFFFDFDFD),
              ),
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Text(
                      "Sort",
                      style: TextStyle(
                        fontFamily: "Montserrat-Regular",
                        fontSize: 13,
                      ),
                    ),
                    Transform.rotate(
                      angle: 90 * pi / 180,
                      child: Icon(
                        Icons.compare_arrows_sharp,
                        size: 17,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              height: 24,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0xFFFDFDFD),
              ),
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Text(
                      "Filter",
                      style: TextStyle(
                        fontFamily: "Montserrat-Regular",
                        fontSize: 13,
                      ),
                    ),
                    Icon(Icons.filter_list_alt, size: 17, color: Colors.black),
                  ],
                ),
              ),
            ),
          ],
        )

      ],
    ),
  );
}