import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_store/pages/components/app_bar.dart';
import 'package:online_store/pages/components/bottom_bar.dart';
import 'package:online_store/pages/components/filter_bar.dart';
import 'package:online_store/pages/components/product.dart';
import 'package:online_store/pages/components/search_bar.dart';
import 'package:online_store/pages/product_detail/index.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  // PageController for deals carousel
  late PageController _dealsPageController;
  int _currentDealPage = 0;
  Timer? _autoScrollTimer;
  
  // ScrollControllers for Deal of the Day and Trending Products
  final ScrollController _dealOfDayController = ScrollController();
  final ScrollController _trendingProductsController = ScrollController();
  
  // Track scroll positions to show/hide navigation buttons
  bool _showDealOfDayBackButton = false;
  bool _showDealOfDayForwardButton = true;
  bool _showTrendingBackButton = false;
  bool _showTrendingForwardButton = true;

  @override
  void initState() {
    super.initState();
    _dealsPageController = PageController(initialPage: 0);
    _dealsPageController.addListener(_onDealPageChanged);
    
    // Add listeners for scroll position changes
    _dealOfDayController.addListener(_updateDealOfDayButtonsVisibility);
    _trendingProductsController.addListener(_updateTrendingButtonsVisibility);
    
    // Start auto-scrolling timer
    _startAutoScroll();
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _dealsPageController.removeListener(_onDealPageChanged);
    _dealOfDayController.removeListener(_updateDealOfDayButtonsVisibility);
    _trendingProductsController.removeListener(_updateTrendingButtonsVisibility);
    _dealsPageController.dispose();
    _dealOfDayController.dispose();
    _trendingProductsController.dispose();
    super.dispose();
  }
  
  void _updateDealOfDayButtonsVisibility() {
    if (!_dealOfDayController.hasClients) return;
    
    setState(() {
      // Show back button if scrolled away from start
      _showDealOfDayBackButton = _dealOfDayController.offset > 10;
      
      // Hide forward button if at or near the end
      _showDealOfDayForwardButton = _dealOfDayController.position.maxScrollExtent - 
          _dealOfDayController.offset > 50;
    });
  }
  
  void _updateTrendingButtonsVisibility() {
    if (!_trendingProductsController.hasClients) return;
    
    setState(() {
      // Show back button if scrolled away from start
      _showTrendingBackButton = _trendingProductsController.offset > 10;
      
      // Hide forward button if at or near the end
      _showTrendingForwardButton = _trendingProductsController.position.maxScrollExtent - 
          _trendingProductsController.offset > 50;
    });
  }

  void _startAutoScroll() {
    // Auto-scroll every 2 seconds
    _autoScrollTimer = Timer.periodic(Duration(seconds: 2), (timer) {
      if (_dealsPageController.hasClients) {
        if (_currentDealPage < deals.length - 1) {
          _dealsPageController.nextPage(
            duration: Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
          );
        } else {
          // When reaching the end, go back to the first page
          _dealsPageController.animateToPage(
            0,
            duration: Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
          );
        }
      }
    });
  }

  void _onDealPageChanged() {
    int page = _dealsPageController.page?.round() ?? 0;
    if (page != _currentDealPage) {
      setState(() {
        _currentDealPage = page;
      });
    }
  }

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

  var dealOfDay = [
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

  var trendingProducts = [
    {
      "image": AssetImage("assets/images/product1.png"),
      "name": "Women Printed Kurta",
      "description": "Neque porro quisquam est qui dolorem ipsum quia",
      "price": 1500,
      "orignal_price": 2499,
      "discount": 40,
    },
    {
      "image": AssetImage("assets/images/product1.png"),
      "name": "Women Printed Kurta",
      "description": "Neque porro quisquam est qui dolorem ipsum quia",
      "price": 1500,
      "orignal_price": 2499,
      "discount": 40,
    },
    {
      "image": AssetImage("assets/images/product1.png"),
      "name": "Women Printed Kurta",
      "description": "Neque porro quisquam est qui dolorem ipsum quia",
      "price": 1500,
      "orignal_price": 2499,
      "discount": 40,
    },
  ];
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(systemNavigationBarColor: Colors.transparent),
    );
    return Scaffold(
      extendBody: true,
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
                buildSearchBar(),
                SizedBox(height: 15),

                //Featured with filters
                buildFilterBar("All Featured"),
                SizedBox(height: 15),

                //Categories
                categoriesSection(),
                SizedBox(height: 15),

                //Deals
                dealsSection(),
                SizedBox(height: 15),

                //Navigation Dots
                dealsNavigationDotsSection(),

                //Deals of the day
                dealsOFTheDaySection(),

                //Deal of the day Products
                dealProductSection(context),

                //Special Offer
                specialOfferSection(),

                //Trending Products Title
                trendingSection(),

                //Trending Products
                trendingProductSection(context),
                SizedBox(height: 10),

                //New Arrivals
                newArrivalSection(),
                SizedBox(height: 90),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: bottomBar(context, "home"),
    );
  }

  Row dealsNavigationDotsSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        deals.length,
        (index) => Container(
          margin: EdgeInsets.symmetric(horizontal: 4),
          child: Icon(
            Icons.circle,
            color: _currentDealPage == index
                ? Color(0xFFFDA2B2)
                : Color(0xFFDDDADA),
            size: 12,
          ),
        ),
      ),
    );
  }

  Container newArrivalSection() {
    return Container(
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
                    Text(
                      "New Arrivals",
                      style: TextStyle(
                        fontFamily: "Montserrat-SemiBold",
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "Summer’ 25 Collections",
                      style: TextStyle(
                        fontFamily: "Montserrat-Regular",
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () => {},
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                      Icon(Icons.arrow_forward, size: 20, color: Colors.white),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Stack trendingProductSection(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        SizedBox(
          height: 235,
          child: ListView.separated(
            controller: _trendingProductsController,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            separatorBuilder: (c, i) {
              return SizedBox(width: 10);
            },
            scrollDirection: Axis.horizontal,
            itemCount: trendingProducts.length,
            itemBuilder: (c, i) {
              return buildProduct(
                trendingProducts[i]['image'] as AssetImage,
                trendingProducts[i]['name'] as String,
                trendingProducts[i]['description'] as String,
                trendingProducts[i]['price'] as int,
                trendingProducts[i]['orignal_price'] as int,
                trendingProducts[i]['discount'] as int,
                null,
                null,
                120,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailPage(),
                    ),
                  );
                },
              );
            },
          ),
        ),
        if (trendingProducts.length > 2 && _showTrendingForwardButton)
          Positioned(
            top: screenHeight * 0.10, // 15% from top
            left: screenWidth * 0.83, // 80% from left
            child: InkWell(
              onTap: () {
                // Scroll to next item
                if (_trendingProductsController.hasClients) {
                  final double currentOffset = _trendingProductsController.offset;
                  final double nextOffset = currentOffset + 220.0; // Approximate item width + spacing
                  _trendingProductsController.animateTo(
                    nextOffset,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn,
                  );
                }
              },
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
        if (trendingProducts.length > 2 && _showTrendingBackButton)
          Positioned(
            top: screenHeight * 0.10, // 15% from top
            left: screenWidth * 0.05, // 5% from left
            child: InkWell(
              onTap: () {
                // Scroll to next item
                if (_trendingProductsController.hasClients) {
                  final double currentOffset = _trendingProductsController.offset;
                  final double nextOffset = currentOffset - 220.0; // Approximate item width + spacing
                  _trendingProductsController.animateTo(
                    nextOffset,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn,
                  );
                }
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Color(0xFFBABABA),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
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

  Stack dealProductSection(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        SizedBox(
          height: 280,
          child: ListView.separated(
            controller: _dealOfDayController,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            separatorBuilder: (c, i) {
              return SizedBox(width: 10);
            },
            scrollDirection: Axis.horizontal,
            itemCount: dealOfDay.length,
            itemBuilder: (c, i) {
              return buildProduct(
                dealOfDay[i]['image'] as AssetImage,
                dealOfDay[i]['name'] as String,
                dealOfDay[i]['description'] as String,
                dealOfDay[i]['price'] as int,
                dealOfDay[i]['orignal_price'] as int,
                dealOfDay[i]['discount'] as int,
                dealOfDay[i]['rating'] as double,
                dealOfDay[i]['review'] as int,
                120,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailPage(),
                    ),
                  );
                },
              );
            },
          ),
        ),
        if (dealOfDay.length > 2 && _showDealOfDayForwardButton)
          Positioned(
            top: screenHeight * 0.12, // 15% from top
            left: screenWidth * 0.83, // 80% from left
            child: InkWell(
              onTap: () {
                // Scroll to next item
                if (_dealOfDayController.hasClients) {
                  final double currentOffset = _dealOfDayController.offset;
                  final double nextOffset = currentOffset + 220.0; // Approximate item width + spacing
                  _dealOfDayController.animateTo(
                    nextOffset,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn,
                  );
                }
              },
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
        if (dealOfDay.length > 2 && _showDealOfDayBackButton)
          Positioned(
            top: screenHeight * 0.12, // 15% from top
            left: screenWidth * 0.05, // 80% from left
            child: InkWell(
              onTap: () {
                // Scroll to next item
                if (_dealOfDayController.hasClients) {
                  final double currentOffset = _dealOfDayController.offset;
                  final double nextOffset = currentOffset - 220.0; // Approximate item width + spacing
                  _dealOfDayController.animateTo(
                    nextOffset,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn,
                  );
                }
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Color(0xFFBABABA),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
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
      height: 200,
      child: PageView.builder(
        controller: _dealsPageController,
        itemCount: deals.length,
        physics: const BouncingScrollPhysics(),
        pageSnapping: true,
        itemBuilder: (context, i) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            width: double.infinity,
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                      image: deals[i]['image'] as AssetImage,
                      fit: BoxFit.fill,
                    ),
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
            child: InkWell(
              onTap: () {},
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
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 10);
        },
      ),
    );
  }
}
