import 'package:flutter/material.dart';
import 'package:online_store/pages/components/app_bar.dart';
import 'package:online_store/pages/components/bottom_bar.dart';
import 'package:online_store/pages/components/rating_stars.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: buildAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  " Cart Items:",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: "Montserrat-SemiBold",
                  ),
                ),
              ),
              const Divider(),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.only(bottom: 10),
                  separatorBuilder: (context, index) => const SizedBox(height: 10),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: screenWidth * 0.35,
                                      margin: const EdgeInsets.only(top: 10, left: 5),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(6),
                                        child: Image.asset(
                                          "assets/images/product1.png",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Women’s Casual Wear",
                                            style: TextStyle(
                                              fontFamily: "Montserrat-SemiBold",
                                              fontSize: 14,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Row(
                                            children: [
                                              const Text(
                                                "Variations : ",
                                                style: TextStyle(
                                                  fontFamily: "Montserrat-Regular",
                                                  fontSize: 12,
                                                ),
                                              ),
                                              _buildVariationBox("Black"),
                                              const SizedBox(width: 5),
                                              _buildVariationBox("Red"),
                                            ],
                                          ),
                                          const SizedBox(height: 5),
                                          Row(
                                            children: [
                                              const Text(
                                                "4.8",
                                                style: TextStyle(
                                                  fontFamily: "Montserrat-SemiBold",
                                                  fontSize: 12,
                                                ),
                                              ),
                                              buildStarRating(4.8, null, 15, null),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            children: [
                                              Container(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 5, vertical: 3),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: const Color(0xFFC9C9C9),
                                                  ),
                                                  borderRadius: BorderRadius.circular(5),
                                                ),
                                                child: const Text(
                                                  "\$ 34.00",
                                                  style: TextStyle(
                                                    fontFamily: "Montserrat-SemiBold",
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: const [
                                                  Text(
                                                    "upto 33% off",
                                                    style: TextStyle(
                                                      fontFamily: "Montserrat-SemiBold",
                                                      fontSize: 9,
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                  Text(
                                                    "\$ 64.00",
                                                    style: TextStyle(
                                                      fontFamily: "Montserrat-SemiBold",
                                                      fontSize: 13,
                                                      color: Color(0xFFA6A6A6),
                                                      decoration: TextDecoration.lineThrough,
                                                      decorationColor: Color(0xFFA6A6A6),
                                                      decorationThickness: 2,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          const Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Total Order (1)   :",
                                  style: TextStyle(
                                    fontFamily: "Montserrat-SemiBold",
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  "\$ 34.00",
                                  style: TextStyle(
                                    fontFamily: "Montserrat-SemiBold",
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFF63758),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Center(
                  child: Text(
                    "Checkout",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Montserrat-SemiBold",
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,)
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomBar(context, "cart"),
    );
  }

  Widget _buildVariationBox(String text) {
    return Container(
      margin: const EdgeInsets.only(left: 4),
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: "Montserrat-Regular",
          fontSize: 11,
        ),
      ),
    );
  }
}
