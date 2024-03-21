import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MySlider extends StatefulWidget {
  @override
  _MySliderState createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  CarouselController buttonCarouselController = CarouselController();
  int _currentIndex = 0;

  final List<String> assetPaths = [
    'assets/c1.png',
    'assets/c4.png',
    'assets/c5.png',
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: <Widget>[
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CarouselSlider(
              items: assetPaths
                  .map((path) => _buildImageWithBorder(path, screenWidth))
                  .toList(),
              carouselController: buttonCarouselController,
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 0.9,
                aspectRatio: 2.0,
                initialPage: 2,
                autoPlayInterval: Duration(seconds: 2),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildPageIndicator(),
            ),
          ],
        ),
        SizedBox(height: 1),
      ],
    );
  }

  Widget _buildImageWithBorder(String imagePath, double screenWidth) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
        width: screenWidth,
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    return List.generate(
      assetPaths.length,
      (index) => Container(
        width: 8.0,
        height: 8.0,
        margin: EdgeInsets.symmetric(horizontal: 4.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _currentIndex == index ? Colors.green : Colors.grey,
        ),
      ),
    );
  }
}
