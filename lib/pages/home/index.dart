import 'dart:math';

import 'package:flutter/material.dart';
import 'package:online_store/pages/components/appBar.dart';
import 'package:online_store/pages/components/bottomBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var categories = [
    {"image": AssetImage("assets/images/category1.png"), 'name': 'Beauty'},
    {"image": AssetImage("assets/images/category2.png"), 'name': 'Fashion'},
    {"image": AssetImage("assets/images/category3.png"), 'name': 'Kids'},
    {"image": AssetImage("assets/images/category4.png"), 'name': 'Mens'},
    {"image": AssetImage("assets/images/category5.png"), 'name': 'Women'},
  ];

  var deals = [
    {"image": AssetImage("assets/images/deal1.png"), 'off': '50-40% OFF'},
    {"image": AssetImage("assets/images/deal1.png"), 'off': '60-70% OFF'},
    {"image": AssetImage("assets/images/deal1.png"), 'off': '30-40% OFF'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Stack(
        children: [
          //Background Color
          Container(
            color: Color(0xFFF7F7F7),
            width: double.infinity,
            height: double.infinity,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                //Search bar
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: searchBox(),
                ),
                SizedBox(height: 15),
                //Featured with filters
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: featuredSection(),
                ),
                SizedBox(height: 15),
                //Categories
                categoriesSection(),
                SizedBox(height: 15),
                //Deals
                dealsSection(),
                //Navigation Dots
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.circle, color: Color(0xFFDDDADA), size: 15),
                    Icon(Icons.circle, color: Color(0xFFFDA2B2), size: 15),
                    Icon(Icons.circle, color: Color(0xFFDDDADA), size: 15),
                  ],
                ),
                //Deals of the day
                dealsOFTheDaySection(),
                //Deal of the day Products
                dealProductSection(),
                //Special Offer
                specialOfferSection(),
                //Trending Products Title
                trendingSection(),
                //Trending Products
                trendingProductSection(),
                SizedBox(height: 10),
                //New Arrivals
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image.asset(
                            "assets/images/newarrival.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("New Arrivals" , style: TextStyle(
                                  fontFamily: "Montserrat-SemiBold",
                                  fontSize: 20,
                                ),),
                                Text("Summer’ 25 Collections" , style: TextStyle(
                                  fontFamily: "Montserrat-Regular",
                                  fontSize: 16,
                                ),),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () => {},
                            child: Container(
                              margin: EdgeInsets.only(right: 10),
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xFFF63758),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    "View all",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: "Montserrat-SemiBold",
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,)
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: bottomBar(context),
    );
  }

  Stack trendingProductSection() {
    return Stack(
      children: [
        SizedBox(
          height: 235,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            separatorBuilder: (c, i) {
              return SizedBox(width: 10);
            },
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (c, i) {
              return Container(
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image(
                          image: AssetImage("assets/images/product1.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0, top: 5),
                      child: Text(
                        "Women Printed Kurta",
                        style: TextStyle(
                          fontFamily: "Montserrat-SemiBold",
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0, top: 4),
                      child: Text(
                        "Neque porro quisquam est qui dolorem ipsum quia",
                        style: TextStyle(
                          fontFamily: "Montserrat-Regular",
                          fontSize: 10,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0, top: 2),
                      child: Text(
                        "₹1500",
                        style: TextStyle(
                          fontFamily: "Montserrat-SemiBold",
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0, top: 1),
                      child: Row(
                        children: [
                          Text(
                            "₹2499",
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
                            "40%Off",
                            style: TextStyle(
                              color: Colors.red,
                              fontFamily: "Montserrat-Regular",
                              fontSize: 10,
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
        Positioned(
          top: 100,
          left: 330,
          child: InkWell(
            onTap: () {},
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Color(0xFFBABABA),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Container trendingSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Color(0xFFFB6D85),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Trending Products",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Montserrat-SemiBold",
                  color: Colors.white,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.calendar_month, color: Colors.white, size: 20),
                  Text(
                    " Last Date 29/02/22",
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: "Montserrat-Regular",
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.transparent,
              border: Border.all(color: Color(0xFFF7F7F7), width: 1.5),
            ),
            //Shop Now btn
            child: InkWell(
              onTap: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "View all",
                    style: TextStyle(
                      color: Color(0xFFF7F7F7),
                      fontFamily: "Montserrat-SemiBold",
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    Icons.arrow_forward_sharp,
                    color: Color(0xFFF7F7F7),
                    size: 15,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container specialOfferSection() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset('assets/images/specialoffer.png'),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Special Offer 😱",
                style: TextStyle(
                  fontFamily: "Montserrat-SemiBold",
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              Text(
                "We make sure you get the\noffer you need at best prices",
                style: TextStyle(
                  fontFamily: "Montserrat-Regular",
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }

  Stack dealProductSection() {
    return Stack(
      children: [
        SizedBox(
          height: 280,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            separatorBuilder: (c, i) {
              return SizedBox(width: 10);
            },
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (c, i) {
              return Container(
                width: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image(
                          image: AssetImage("assets/images/product1.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0, top: 5),
                      child: Text(
                        "Women Printed Kurta",
                        style: TextStyle(
                          fontFamily: "Montserrat-SemiBold",
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0, top: 4),
                      child: Text(
                        "Neque porro quisquam est qui dolorem ipsum quia",
                        style: TextStyle(
                          fontFamily: "Montserrat-Regular",
                          fontSize: 10,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0, top: 2),
                      child: Text(
                        "₹1500",
                        style: TextStyle(
                          fontFamily: "Montserrat-SemiBold",
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0, top: 1),
                      child: Row(
                        children: [
                          Text(
                            "₹2499",
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
                            "40%Off",
                            style: TextStyle(
                              color: Colors.red,
                              fontFamily: "Montserrat-Regular",
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0, top: 1),
                      child: Row(
                        children: [
                          Icon(Icons.star, size: 15, color: Color(0xFFEBB210)),
                          Icon(Icons.star, size: 15, color: Color(0xFFEBB210)),
                          Icon(Icons.star, size: 15, color: Color(0xFFEBB210)),
                          Icon(Icons.star, size: 15, color: Color(0xFFEBB210)),
                          Icon(
                            Icons.star_half,
                            size: 15,
                            color: Color(0xFFBABABA),
                          ),

                          SizedBox(width: 5),

                          Text(
                            "56890",
                            style: TextStyle(
                              fontFamily: "Montserrat-Regular",
                              fontSize: 10,
                              color: Color(0xFFBABABA),
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
        Positioned(
          top: 130,
          left: 330,
          child: InkWell(
            onTap: () {},
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Color(0xFFBABABA),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Container dealsOFTheDaySection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Color(0xFF4391F7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Deal of the Day",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Montserrat-SemiBold",
                  color: Colors.white,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.alarm, color: Colors.white, size: 20),
                  Text(
                    " 22h 55m 20s remaining",
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: "Montserrat-Regular",
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.transparent,
              border: Border.all(color: Color(0xFFF7F7F7), width: 1.5),
            ),
            //Shop Now btn
            child: InkWell(
              onTap: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "View all",
                    style: TextStyle(
                      color: Color(0xFFF7F7F7),
                      fontFamily: "Montserrat-SemiBold",
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    Icons.arrow_forward_sharp,
                    color: Color(0xFFF7F7F7),
                    size: 15,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox dealsSection() {
    return SizedBox(
      height: 210,
      child: ListView.builder(
        itemCount: deals.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            width: 350,
            height: 200,
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Image(
                    image: deals[i]['image'] as AssetImage,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        deals[i]['off'] as String? ?? '',
                        style: TextStyle(
                          color: Color(0xFFF7F7F7),
                          fontFamily: "Montserrat-SemiBold",
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "Now in (product)\nAll colors",
                        style: TextStyle(
                          color: Color(0xFFF7F7F7),
                          fontFamily: "Montserrat-Regular",
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 10),
                      //Shop now button
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.transparent,
                          border: Border.all(
                            color: Color(0xFFF7F7F7),
                            width: 1.5,
                          ),
                        ),
                        //Shop Now btn
                        child: InkWell(
                          onTap: () {},
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Shop Now",
                                style: TextStyle(
                                  color: Color(0xFFF7F7F7),
                                  fontFamily: "Montserrat-SemiBold",
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.arrow_forward_sharp,
                                color: Color(0xFFF7F7F7),
                                size: 15,
                              ),
                            ],
                          ),
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
    );
  }

  SizedBox categoriesSection() {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20),
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 80,
            width: 70,
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: categories[index]['image'] as AssetImage,
                  radius: 30,
                ),
                Text(
                  categories[index]['name'] as String? ?? '',
                  style: TextStyle(
                    fontFamily: "Montserrat-SemiBold",
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 10);
        },
      ),
    );
  }

  Row featuredSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 5),
        Text(
          "All Featured",
          style: TextStyle(fontFamily: "Montserrat-SemiBold", fontSize: 18),
        ),
        SizedBox(width: 102),
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
    );
  }

  TextField searchBox() {
    return TextField(
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
    );
  }
}
