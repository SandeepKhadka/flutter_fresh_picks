import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:keyboard/Pages/Product_Details.dart';
import 'package:keyboard/newAdded/api_constants.dart';

import '../controller/getProduct_controller.dart';
import '../controller/wishlist_controller.dart';

class BestSelling extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: GetBuilder<ProductController>(
          builder: (_) => GetBuilder<WishlistController>(
            builder: (wishlistController) => ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _.products.length,
              itemBuilder: (context, index) {
                bool isInWishlist =
                    wishlistController.isInWishlist(_.products[index]);
                bool isInCart = wishlistController.isInCart(_.products[index]);

                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetails(
                            productss: _.products[index],
                          ),
                        ),
                      );
                    },
                    child: 
                    
                    Container(
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
                          Image.network(
                            PRODUCT_IMAGE_URL + _.products[index].image,
                            height: 130,
                            fit: BoxFit
                                .cover, // Optional: Adjust the image fit based on your requirement
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _.products[index].name,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    _.products[index].description,
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  SizedBox(height: 5),
                                  SizedBox(height: 5),
                                  Text(
                                    "RS= " + _.products[index].price,
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
                                icon: Icon(
                                  isInWishlist
                                      ? Icons.favorite
                                      : Icons.favorite_border_rounded,
                                  color:
                                      isInWishlist ? Colors.red : Colors.grey,
                                ),
                                onPressed: () {
                                  if (isInWishlist) {
                                    wishlistController
                                        .removeFromWishlist(_.products[index]);
                                    print(
                                        'Removed from wishlist: ${_.products[index].name}');
                                  } else {
                                    wishlistController
                                        .addToWishlist(_.products[index]);
                                    print(
                                        'Added to wishlist: ${_.products[index].name}');
                                  }
                                  _.update(); // Update the UI
                                },
                              ),
                              SizedBox(height: 60),
                              IconButton(
                                icon: Icon(
                                  isInCart
                                      ? CupertinoIcons.cart_fill
                                      : CupertinoIcons.cart,
                                  color: isInCart ? Colors.red : Colors.grey,
                                ),
                                onPressed: () {
                                  if (isInCart) {
                                    wishlistController
                                        .removeFromCart(_.products[index]);
                                    print(
                                        'Removed from cart: ${_.products[index].name}');
                                  } else {
                                    wishlistController
                                        .addTocart(_.products[index]);
                                    print(
                                        'Added to cart: ${_.products[index].name}');
                                  }
                                  _.update(); // Update the UI
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
