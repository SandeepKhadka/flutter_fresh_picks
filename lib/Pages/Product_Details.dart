import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard/cart/my_cart_view.dart';
import 'package:keyboard/model/getProducts_model.dart';
import 'package:keyboard/newAdded/api_constants.dart';
import 'package:keyboard/newAdded/snackbar.dart';
import '../controller/wishlist_controller.dart'; // Import WishlistController

class ProductDetails extends StatelessWidget {
  final GetProducts productss; // Change the type to GetProducts

  ProductDetails({required this.productss}); // Update the constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        actions: [
          GetBuilder<WishlistController>(
            builder: (wishlistController) => Row(
              children: [
                IconButton(
                  onPressed: () {
                    if (wishlistController.isInCart(productss)) {
                      wishlistController.removeFromCart(productss);
                      wishlistController.update();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Product removed from cart'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                      AppSnackbar();
                    } else {
                      wishlistController.addTocart(productss);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Product added to cart'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                      wishlistController.update();
                    }
                  },
                  icon: Icon(wishlistController.isInCart(productss)
                      ? CupertinoIcons.cart_fill
                      : CupertinoIcons.cart),
                  color: wishlistController.isInCart(productss)
                      ? Colors.red
                      : null,
                ),
                IconButton(
                  onPressed: () {
                    if (wishlistController.isInWishlist(productss)) {
                      wishlistController.removeFromWishlist(productss);
                      wishlistController.update();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Product remove from wishlist'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    } else {
                      wishlistController.addToWishlist(productss);
                      wishlistController.update();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Product added to wishlist'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    }
                  },
                  icon: Icon(
                    wishlistController.isInWishlist(productss)
                        ? Icons.favorite
                        : Icons.favorite_border_rounded,
                    color: wishlistController.isInWishlist(productss)
                        ? Colors.red
                        : null,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .3,
              margin: EdgeInsets.symmetric(vertical: 20),
              width: double.infinity,
              color: Colors.grey[200],
              child: Image.network(
                PRODUCT_IMAGE_URL + productss.image,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productss.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Per KG",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Price: ${double.parse(productss.discount) > 0 ? productss.discount : productss.price}",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Divider(thickness: 1),
                  SizedBox(height: 5),
                  Text(
                    productss.description,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                  Divider(thickness: 1),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Quantity",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            child: Text(
                              productss.quantity + "  KG",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Divider(thickness: 1),
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(MyCart());
                      },
                      child: Text("Go to Cart"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
