import 'package:flutter/material.dart';

Widget buildStarRating(double rating, int totalRatings, double iconSize, double textSize) {
  List<Widget> stars = [];

  int fullStars = rating.floor();
  bool hasHalfStar = (rating - fullStars) >= 0.5;

  for (int i = 0; i < fullStars; i++) {
    stars.add(Icon(Icons.star, size: iconSize, color: Color(0xFFEBB210)));
  }

  if (hasHalfStar) {
    stars.add(Icon(Icons.star_half, size: iconSize, color: Color(0xFFEBB210)));
  }

  while (stars.length < 5) {
    stars.add(Icon(Icons.star_border, size: iconSize, color: Color(0xFFEBB210)));
  }

  // Add spacing and total ratings text
  stars.add(SizedBox(width: 5));
  stars.add(Text(
    totalRatings.toString(),
    style: TextStyle(
      fontFamily: "Montserrat-Regular",
      fontSize: textSize,
      color: Color(0xFFBABABA),
    ),
  ));

  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: stars,
  );
}
