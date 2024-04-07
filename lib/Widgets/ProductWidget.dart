import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard/controller/getProduct_controller.dart';
import 'package:keyboard/newAdded/api_constants.dart';
import '../Pages/Product_Details.dart';

class ProductItemWidget extends StatelessWidget {
  // Define lists for product names, images, descriptions, and prices
  final List<String> productNames = [
    "Fruits",
    "Vegetables",
    "Dairy Products",
    "Exotic Foods",
  ];

  final List<String> productImages = [
    "assets/fruits.png",
    "assets/vegetables.png",
    "assets/dairy.png",
    "assets/df.png",
  ];

  final List<String> productDescriptions = [
    "Description of Fruits",
    "Description of Vegetables",
    "Description of Dairy Products",
    "Description of Exotic Foods",
  ];

  final List<String> productNutritions = [
    "100",
    "200",
    "300",
    "400",
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: GetBuilder<ProductController>(
            builder: (_) => ListView.builder(
                itemCount: _.getDiscountProduct.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GridView.count(
                        childAspectRatio: 0.72,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        mainAxisSpacing: 25, // Add main axis spacing
                        crossAxisSpacing: 10, // Add cross axis spacing
                        shrinkWrap: true,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => ProductDetails(
                              //       name: productNames[i],
                              //       image: productImages[i],
                              //       price: (i + 1) * 100,
                              //       description: productDescriptions[i],
                              //       nutrition: productNutritions[i],
                              //       isFavorite: false,
                              //       // Pass other necessary details to the product page
                              //     ),
                              //   ),
                              // );
                            },
                            child: GestureDetector(
                              onTap: () {
                                Get.to(ProductDetails(
                                  productss: _.getDiscountProduct[index],
                                ));
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Container(
                                  width: 170,
                                  height: 100, // Adjusted height
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
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: 10, top: 10, right: 10),
                                            constraints: BoxConstraints(
                                                maxHeight:
                                                    190), // Adjusted max height for the image
                                            child: Image.network(
                                              PRODUCT_IMAGE_URL +
                                                  _.getDiscountProduct[index]
                                                      .image,
                                              height: 100,
                                              fit: BoxFit
                                                  .cover, // Optional: Adjust the image fit based on your requirement
                                            ),

                                            // Image.asset(
                                            //   "", // Use dynamic image
                                            //   fit: BoxFit.cover,
                                            // ),
                                          ),
                                          SizedBox(
                                              height:
                                                  10), // Added space between image and text
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8),
                                            child: Text(
                                              _.getDiscountProduct[index]
                                                  .name, // Use dynamic product name
                                              style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Text(
                                            "${_.getDiscountProduct[index].quantity}KG",
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),

                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Rs ${_.getDiscountProduct[index].price}", // Original price
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.grey[600],
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                ),
                                              ),
                                              Text(
                                                "Rs ${_.getDiscountProduct[index].discount}", // Discounted price
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.green[400],
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Icon(
                                        Icons.add_box_rounded,
                                        color: Colors.green,
                                        size: 30,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                          height:
                              20), // Add some spacing between GridView and ListView
                      SizedBox(height: 20), // Add some spacing at the bottom
                    ],
                  );
                })));
  }
}



//




