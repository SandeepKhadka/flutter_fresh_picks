import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard/model/getProducts_model.dart';
import 'package:keyboard/newAdded/ui_assets.dart';
import '../controller/wishlist_controller.dart';
import '../Pages/Product_Details.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: Text('Favorite Page'),
      ),
      body: Get.find<WishlistController>().wishlist.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    UIAssets.emptyWishlist,
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width / 2,
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Your wishlist is empty",
                    style: TextStyle(fontSize: 18),                  ),
                ],
              ),
            )
          : GetBuilder<WishlistController>(
              builder: (_) => ListView.builder(
                itemCount: _.wishlist.length,
                itemBuilder: (context, index) {
                  final product = _.wishlist[index];
                  return ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navigate to product details page when clicking on product name
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailsPage(
                                  product: product,
                                ),
                              ),
                            );
                          },
                          child: Text(
                            product.name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          'Price: ${product.price}',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        // Remove item from wishlist when clicking on delete button
                        _.removeFromWishlist(product);
                        _.update();
                      },
                    ),
                  );
                },
              ),
            ),
    );
  }
}

class ProductDetailsPage extends StatelessWidget {
  final GetProducts product;

  const ProductDetailsPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: ${product.name}'),
            Text('Image: ${product.image}'),
            Text('Description: ${product.description}'),
            Text('Price: ${product.price}'),
            // Text('Nutrition: ${product.nutrition}'),
            // Text('Is Favorite: ${product.isFavorite}'),
          ],
        ),
      ),
    );
  }
}
