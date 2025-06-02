import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_store/pages/components/filter_bar.dart';
import 'package:online_store/pages/components/product.dart';
import 'package:online_store/pages/components/rating_stars.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final productDetails = {
    'name': 'Women Printed Kurta',
    'images': [
      'assets/images/product1.png',
      'assets/images/product1.png',
      'assets/images/product1.png',
      'assets/images/product1.png',
      'assets/images/product1.png',
    ],
    'size': '7UK',
    'description':
        'Perhaps the most iconic sneaker of all-time, this original "Chicago"? colorway is the cornerstone to any sneaker collection. Made famous in 1985 by Michael Jordan, the shoe has stood the test of time, becoming the most famous colorway of the Air Jordan 1. This 2015 release saw the ...More',
    'price': 1500,
    'orignal_price': 2999,
    'discount': 40,
    'rating': 4.5,
    'review': 56890,
  };

  final similarProducts = [
    {
      "image": AssetImage("assets/images/product1.png"),
      "name": "Women Printed Kurta",
      "description": "Neque porro quisquam est qui dolorem ipsum quia",
      "price": 1500,
      "rating": 4.5,
      "review": 56890,
    },
    {
      "image": AssetImage("assets/images/product1.png"),
      "name": "Women Printed Kurta",
      "description": "Neque porro quisquam est qui dolorem ipsum quia",
      "price": 1500,
      "rating": 4.5,
      "review": 56890,
    },
    {
      "image": AssetImage("assets/images/product1.png"),
      "name": "Women Printed Kurta",
      "description": "Neque porro quisquam est qui dolorem ipsum quia",
      "price": 1500,
      "rating": 4.5,
      "review": 56890,
    },
    {
      "image": AssetImage("assets/images/product1.png"),
      "name": "Women Printed Kurta",
      "description": "Neque porro quisquam est qui dolorem ipsum quia",
      "price": 1500,
      "rating": 4.5,
      "review": 56890,
    },
    {
      "image": AssetImage("assets/images/product1.png"),
      "name": "Women Printed Kurta",
      "description": "Neque porro quisquam est qui dolorem ipsum quia",
      "price": 1500,
      "rating": 4.5,
      "review": 56890,
    },
    {
      "image": AssetImage("assets/images/product1.png"),
      "name": "Women Printed Kurta",
      "description": "Neque porro quisquam est qui dolorem ipsum quia",
      "price": 1500,
      "rating": 4.5,
      "review": 56890,
    },
  ];

  void _goToNextPage() {
    if (_currentPage < ((productDetails['images']! as List).length - 1)) {
      _pageController.animateToPage(
        ++_currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToPreviousPage() {
    if (_currentPage > 0) {
      _pageController.animateToPage(
        --_currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(systemNavigationBarColor: Colors.transparent),
    );
    final images = productDetails['images'] as List<String>;
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [Icon(FontAwesomeIcons.cartShopping)],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              productImageSection(images, context),

              // Dots indicator
              dotsIndicator(images),

              //Size
              sizeSection(),

              //name
              nameSection(),

              //Rating
              ratingSection(),

              //Price
              priceSection(),

              //Description
              descriptionSection(),

              //Buttons
              actionButtonsSection(),

              //Deliver Slogan
              deliverySloganSection(),

              //Similar products
              similarProductHeadingSection(),

              //Filter section
              buildFilterBar("${similarProducts.length}+ Items"),

              //products
              GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                physics: NeverScrollableScrollPhysics(), // Prevent conflict with SingleChildScrollView
                shrinkWrap: true, // Important to avoid unbounded height in a scrollable column
                itemCount: similarProducts.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, i) {
                  return buildProduct(
                    similarProducts[i]['image'] as AssetImage,
                    similarProducts[i]['name'] as String,
                    similarProducts[i]['description'] as String,
                    similarProducts[i]['price'] as int,
                    null, // Add missing keys to similarProducts if needed
                    null,
                    similarProducts[i]['rating'] as double,
                    similarProducts[i]['review'] as int,
                    135,
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProductDetailPage()),
                      );
                    },
                  );
                },
              ),

            ],
          ),
        ),
      ),
    );
  }

  Padding similarProductHeadingSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Text(
        "Similar Products",
        style: TextStyle(fontSize: 20, fontFamily: "Montserrat-SemiBold"),
      ),
    );
  }

  Padding deliverySloganSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFFFDCBD4),
        ),
        child: Text(
          "Delivery in\n1 within Hour",
          style: TextStyle(fontSize: 20, fontFamily: "Montserrat-SemiBold"),
        ),
      ),
    );
  }

  Padding actionButtonsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: Row(
        children: [
          buttonBuilder(
            "Go to cart",
            Icon(Icons.shopping_cart_outlined, color: Colors.white),
            Color(0xFF2361BE),
          ),
          SizedBox(width: 10),
          buttonBuilder(
            "Buy Now",
            ImageIcon(
              AssetImage("assets/images/press-button.png"),
              color: Colors.white,
            ),
            Color(0xFF50D687),
          ),
        ],
      ),
    );
  }

  Widget buttonBuilder(String cartTitle, Widget cartIcon, Color buttonColor) {
    return InkWell(
      onTap: () {},
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(left: 15, top: 3.5),
            padding: EdgeInsets.only(left: 40, top: 10, bottom: 10, right: 15),
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              cartTitle,
              style: TextStyle(
                fontSize: 17,
                fontFamily: "Montserrat-SemiBold",
                color: Colors.white,
              ),
            ),
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: buttonColor,
            ),
            child: Stack(
              children: [
                // Inset shadow layer
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: RadialGradient(
                      center: Alignment.center,
                      radius: 0.8,
                      colors: [
                        Colors.transparent, // fades to transparent at edges
                        Colors.black.withOpacity(0.4), // shadow inside center
                      ],
                      stops: [0.0, 1.0],
                    ),
                  ),
                ),
                // Icon layer
                Center(child: cartIcon),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column descriptionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
          child: Text(
            "Product Details",
            style: TextStyle(fontSize: 15, fontFamily: "Montserrat-SemiBold"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            productDetails['description'] as String,
            style: TextStyle(fontSize: 15, fontFamily: "Montserrat-Regular"),
          ),
        ),
      ],
    );
  }

  Padding priceSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "₹${productDetails['orignal_price']}",
            style: TextStyle(
              fontSize: 15,
              fontFamily: "Montserrat-SemiBold",
              color: Color(0xFFBABABA),
              decoration: TextDecoration.lineThrough,
              decorationThickness: 2,
              decorationColor: Color(0xFFBABABA),
            ),
          ),
          SizedBox(width: 10),
          Text(
            "₹${productDetails['price']}",
            style: TextStyle(fontSize: 15, fontFamily: "Montserrat-SemiBold"),
          ),
          SizedBox(width: 10),
          Text(
            "${productDetails['discount']}% Off",
            style: TextStyle(
              fontSize: 15,
              fontFamily: "Montserrat-SemiBold",
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  Padding ratingSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
      child: buildStarRating(4.5, 56890, 20.0, 15.0),
    );
  }

  Padding nameSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Text(
        productDetails['name'] as String,
        style: TextStyle(fontSize: 20, fontFamily: "Montserrat-SemiBold"),
      ),
    );
  }

  Padding sizeSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
      child: Text(
        "Size: ${productDetails['size'] ?? 'N/A'}",
        style: TextStyle(fontSize: 15, fontFamily: "Montserrat-SemiBold"),
      ),
    );
  }

  Row dotsIndicator(List<String> images) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(images.length, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Icon(
            Icons.circle,
            color: index == _currentPage
                ? Color(0xFFF63758)
                : Color(0xFFDDDADA),
            size: 15,
          ),
        );
      }),
    );
  }

  SizedBox productImageSection(List<String> images, BuildContext context) {
    return SizedBox(
      height: 280,
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: images.length,
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    images[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              );
            },
          ),
          // Forward button
          if (_currentPage < images.length - 1)
            Positioned(
              top: MediaQuery.of(context).size.height * 0.13,
              left: MediaQuery.of(context).size.width * 0.83,
              child: InkWell(
                onTap: _goToNextPage,
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Color(0xFFBABABA),
                  ),
                  child: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
          //Back Button
          if (_currentPage > 0)
            Positioned(
              top: MediaQuery.of(context).size.height * 0.13,
              left: MediaQuery.of(context).size.width * 0.05,
              child: InkWell(
                onTap: _goToPreviousPage,
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Color(0xFFBABABA),
                  ),
                  child: Icon(Icons.arrow_back_ios_new_rounded),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
