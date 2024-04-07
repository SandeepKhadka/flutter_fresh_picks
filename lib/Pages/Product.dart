import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard/Pages/According_to_Category.dart';
import 'package:keyboard/ProductWidget/DairyWidget.dart';
import 'package:keyboard/ProductWidget/ExoticFruits.dart';
import 'package:keyboard/ProductWidget/ExoticWidget.dart';
import 'package:keyboard/controller/getCategoryController.dart';
import 'package:keyboard/controller/getProduct_controller.dart';
import 'package:keyboard/newAdded/api_constants.dart';
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
        body: SingleChildScrollView(
          child: GetBuilder<GetCategoryController>(
              builder: (_) => ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _.getCategory.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 5,
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          onTap: () {
                            // Get.find<ProductController>()
                            //     .GetProductAccoridngCategory(
                            //         _.getCategory[index].id);

                            // print(Get.find<ProductController>()
                            //     .GetProductAccoridngCategory(
                            //         _.getCategory[index].id));
                            // print(Get.find<ProductController>()
                            //     .getProductAccCategory
                            //     .length);

                            // print(_.getCategory[index].id);

                            Get.to(AccToCategory(
                              categoryId: _.getCategory[index].id,
                            ));
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => pageToNavigate),
                            // );
                          },
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 100,
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
                                ]),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.network(
                                    CATEGORY_IMAGE_URL +
                                        _.getCategory[index].image,
                                    height: 48,
                                    width: 48,
                                    fit: BoxFit
                                        .cover, // Optional: Adjust the image fit based on your requirement
                                  ),
                                ),
                                SizedBox(width: 16.0),
                                Text(
                                  _.getCategory[index].title,
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
                  }))),
        ));
  }
}









      // Padding(
      //   padding: const EdgeInsets.only(top: 20.0),
      //   child: ListView(
      //     children: [
      //       _buildCategoryTile('Fruits', 'assets/fruits.png', true,
      //           FruitsWidget()), // Navigate to FruitsWidget
      //       _buildCategoryTile('Vegetables', 'assets/vegetables.png', true,
      //           VegetableWidget()), // Navigate to VegetableWidget
      //       _buildCategoryTile('Dairy Products', 'assets/dairy.png', true,
      //           DairyWidget()), // Navigate to DairyWidget
      //       _buildCategoryTile(
      //           'Exotic Vegetables', 'assets/exoti.png', true, ExoticWidget()),
      //       _buildCategoryTile('Exotic Fruits', 'assets/exoti.png', true,
      //           ExoticFruitsWidget()),
      //       // Navigate to ExoticWidget
      //     ],
      //   ),
      // ),





