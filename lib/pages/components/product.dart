import 'package:flutter/material.dart';
import 'package:online_store/pages/components/rating_stars.dart';

Widget buildProduct(
  AssetImage image,
  String name,
  String description,
  int price,
  int orignalPrice,
  int discount,
  double? rating,
  int? reviews,
) {
  return Container(
    width: 150,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(6),
      color: Colors.white,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Image
        SizedBox(
          width: double.infinity,
          height: 120,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image(image: image, fit: BoxFit.cover),
          ),
        ),
        //Product Name
        Padding(
          padding: const EdgeInsets.only(left: 5.0, top: 5),
          child: Text(
            name,
            style: TextStyle(fontFamily: "Montserrat-SemiBold", fontSize: 12),
          ),
        ),
        //Product Description
        Padding(
          padding: const EdgeInsets.only(left: 5.0, top: 4),
          child: Text(
            description,
            style: TextStyle(
              fontFamily: "Montserrat-Regular",
              fontSize: 10,
              color: Colors.black,
            ),
          ),
        ),
        //Product Price
        Padding(
          padding: const EdgeInsets.only(left: 5.0, top: 2),
          child: Text(
            "₹$price",
            style: TextStyle(fontFamily: "Montserrat-SemiBold", fontSize: 12),
          ),
        ),
        //Product Discount
        Padding(
          padding: const EdgeInsets.only(left: 5.0, top: 1),
          child: Row(
            children: [
              Text(
                "₹$orignalPrice",
                style: TextStyle(
                  color: Color(0xFFBABABA),
                  fontFamily: "Montserrat-Regular",
                  fontSize: 10,
                  decoration: TextDecoration.lineThrough,
                  decorationThickness: 1.5,
                ),
              ),
              SizedBox(width: 5),
              Text(
                "$discount%Off",
                style: TextStyle(
                  color: Colors.red,
                  fontFamily: "Montserrat-Regular",
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
        if (rating != null && reviews != null)
          Padding(
            padding: const EdgeInsets.only(left: 5.0, top: 1),
            child: buildStarRating(
              rating,
              reviews,
            ),
          ),
      ],
    ),
  );
}
