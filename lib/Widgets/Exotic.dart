import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard/Favourite/fav_screen.dart';
import 'package:keyboard/controller/getProduct_controller.dart';
import 'package:keyboard/controller/wishlist_controller.dart';
import 'package:keyboard/newAdded/api_constants.dart';
import '../Pages/Product_Details.dart';

class ExoticItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250, // Specify a fixed height for the container
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: GetBuilder<ProductController>(
          builder: (_) => GetBuilder<WishlistController>(
            builder: (wishlistController) => Row(
              children: [
                for (int index = 0; index < _.exoticproducts.length; index++)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 7),
                    child: Container(
                      width: 170,
                      height: 225,
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
                      child: GestureDetector(
                        onTap: () {
                          Get.to(ProductDetails(
                            productss: _.exoticproducts[index],
                          ));
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                PRODUCT_IMAGE_URL +
                                    _.exoticproducts[index].image,
                                height: 130,
                                fit: BoxFit
                                    .cover, // Optional: Adjust the image fit based on your requirement
                              ),
                              Text(
                                _.exoticproducts[index].name,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                "Quantity = " +
                                    
                                    " 1 KG",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Rs " +  _.exoticproducts[index].price , // Example price calculation
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.green[400],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Icon(
                                    Icons.add_box_rounded,
                                    color: Colors.green,
                                    size: 30,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
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
