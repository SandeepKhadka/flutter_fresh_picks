import 'package:flutter/material.dart';
import 'package:keyboard/ProductWidget/DairyWidget.dart';
import 'package:keyboard/ProductWidget/ExoticFruits.dart';
import 'package:keyboard/ProductWidget/ExoticWidget.dart';
import '../ProductWidget/VegetableWidget.dart';
import '../ProductWidget/FruitsWidget.dart';

class Product extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Find Products',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: ListView(
          children: [
            _buildCategoryTile('Fruits', 'assets/fruits.png', true,
                FruitsWidget()), // Navigate to FruitsWidget
            _buildCategoryTile('Vegetables', 'assets/vegetables.png', true,
                VegetableWidget()), // Navigate to VegetableWidget
            _buildCategoryTile('Dairy Products', 'assets/dairy.png', true,
                DairyWidget()), // Navigate to DairyWidget
            _buildCategoryTile(
                'Exotic Vegetables', 'assets/exoti.png', true, ExoticWidget()),
            _buildCategoryTile('Exotic Fruits', 'assets/exoti.png', true,
                ExoticFruitsWidget()),
            // Navigate to ExoticWidget
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryTile(
      String title, String imagePath, bool addShadow, Widget pageToNavigate) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Material(
        color: Colors.transparent,
        elevation: addShadow ? 5 : 0,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => pageToNavigate),
            );
          },
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: addShadow
                  ? [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ]
                  : [],
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    imagePath,
                    width: 48,
                    height: 48,
                  ),
                ),
                SizedBox(width: 16.0),
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Product(),
  ));
}
