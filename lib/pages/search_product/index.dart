import 'package:flutter/material.dart';
import 'package:online_store/pages/components/app_bar.dart';
import 'package:online_store/pages/components/bottom_bar.dart';
import 'package:online_store/pages/components/filter_bar.dart';
import 'package:online_store/pages/components/product.dart';
import 'package:online_store/pages/components/search_bar.dart';

class searchProductPage extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      "image": AssetImage("assets/images/product1.png"),
      "name": "Women Printed Kurta",
      "description": "Neque porro quisquam est qui dolorem ipsum quia",
      "price": 1500,
      "orignal_price": 2499,
      "discount": 40,
      "rating": 4.5,
      "review": 56890,
    },
    {
      "image": AssetImage("assets/images/product1.png"),
      "name": "Women Printed Kurta",
      "description": "Neque porro quisquam est qui dolorem ipsum quia",
      "price": 1500,
      "orignal_price": 2499,
      "discount": 40,
      "rating": 4.5,
      "review": 56890,
    },
    {
      "image": AssetImage("assets/images/product1.png"),
      "name": "Women Printed Kurta",
      "description": "Neque porro quisquam est qui dolorem ipsum quia",
      "price": 1500,
      "orignal_price": 2499,
      "discount": 40,
      "rating": 4.5,
      "review": 56890,
    },
    {
      "image": AssetImage("assets/images/product1.png"),
      "name": "Women Printed Kurta",
      "description": "Neque porro quisquam est qui dolorem ipsum quia",
      "price": 1500,
      "orignal_price": 2499,
      "discount": 40,
      "rating": 4.5,
      "review": 56890,
    },
    {
      "image": AssetImage("assets/images/product1.png"),
      "name": "Women Printed Kurta",
      "description": "Neque porro quisquam est qui dolorem ipsum quia",
      "price": 1500,
      "orignal_price": 2499,
      "discount": 40,
      "rating": 4.5,
      "review": 56890,
    },
    {
      "image": AssetImage("assets/images/product1.png"),
      "name": "Women Printed Kurta",
      "description": "Neque porro quisquam est qui dolorem ipsum quia",
      "price": 1500,
      "orignal_price": 2499,
      "discount": 40,
      "rating": 4.5,
      "review": 56890,
    },
    {
      "image": AssetImage("assets/images/product1.png"),
      "name": "Women Printed Kurta",
      "description": "Neque porro quisquam est qui dolorem ipsum quia",
      "price": 1500,
      "orignal_price": 2499,
      "discount": 40,
      "rating": 4.5,
      "review": 56890,
    },
    {
      "image": AssetImage("assets/images/product1.png"),
      "name": "Women Printed Kurta",
      "description": "Neque porro quisquam est qui dolorem ipsum quia",
      "price": 1500,
      "orignal_price": 2499,
      "discount": 40,
      "rating": 4.5,
      "review": 56890,
    },
    {
      "image": AssetImage("assets/images/product1.png"),
      "name": "Women Printed Kurta",
      "description": "Neque porro quisquam est qui dolorem ipsum quia",
      "price": 1500,
      "orignal_price": 2499,
      "discount": 40,
      "rating": 4.5,
      "review": 56890,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        color: const Color(0xFFF7F7F7),
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildSearchBar(),
              buildFilterBar("${products.length}+ Items"),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: products.length,
                padding: EdgeInsets.symmetric(horizontal: 10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent:
                      280, // adjust based on your product card height
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return buildProduct(
                    product['image'] as AssetImage,
                    product['name'] as String,
                    product['description'] as String,
                    product['price'] as int,
                    product['orignal_price'] as int,
                    product['discount'] as int,
                    product['rating'] as double,
                    product['review'] as int,
                    165,
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomBar(context, "search"),
    );
  }
}
