import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../Pages/Product_Details.dart';

class BestSelling extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      "name": "Star Fruit",
      "image": "assets/starfruit.png",
      "description": "Indulge in a celestial flavor experience with star fruit",
      "price": "Rs 480",
      "rating": 2,
    },
    {
      "name": "Marpha Apple",
      "image": "assets/apple.png",
      "description": "Juicy symphony of flavors with the classic apple",
      "price": "Rs 250",
      "rating": 4.0,
    },
    {
      "name": "Spinach",
      "image": "assets/spinach.png",
      "description":
          "Dive into its vibrant green hues and savor the earthy essence",
      "price": "Rs 80",
      "rating": 4.5,
    },
  ];

  final List<String> productNutritions = [
    "100",
    "200",
    "150",
  ]; // Adjust the list according to your actual nutritional data

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            for (int index = 0; index < products.length; index++)
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetails(
                        name: products[index]['name'],
                        image: products[index]['image'],
                        description: products[index]['description'],
                        price: (index + 1) * 100,
                        nutrition: productNutritions[index],
                        isFavorite: false, // Provide nutrition data
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          child: Image.asset(
                            products[index]['image'],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  products[index]['name'],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  products[index]['description'],
                                  style: TextStyle(fontSize: 14),
                                ),
                                SizedBox(height: 5),
                                RatingBar.builder(
                                  initialRating:
                                      products[index]['rating'].toDouble(),
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  itemCount: 5,
                                  itemSize: 20,
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.green,
                                  ),
                                  onRatingUpdate: (double rating) {},
                                ),
                                SizedBox(height: 5),
                                Text(
                                  products[index]['price'],
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: Icon(Icons.favorite_border_rounded),
                              color: Colors.red,
                              onPressed: () {},
                            ),
                            SizedBox(height: 60),
                            IconButton(
                              icon: Icon(CupertinoIcons.cart_fill),
                              color: Colors.green,
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
