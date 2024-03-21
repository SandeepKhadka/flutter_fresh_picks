import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final String name;
  final String image;
  final int price;
  final String description;
  final String nutrition;
  final bool isFavorite; // Add isFavorite parameter

  ProductDetails({
    required this.name,
    required this.image,
    required this.price,
    required this.description,
    required this.nutrition,
    required this.isFavorite, // Accept isFavorite parameter
  });

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool isFavorite = false; // Initialize isFavorite to false

  @override
  void initState() {
    super.initState();
    // Update isFavorite from the passed parameter
    isFavorite = widget.isFavorite;
  }

  void incrementCounter() {
    setState(() {
      // Your implementation for incrementing counter
    });
  }

  void decrementCounter() {
    setState(() {
      // Your implementation for decrementing counter
    });
  }

  void updateTotalPrice() {
    setState(() {
      // Your implementation for updating total price
    });
  }

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
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .3,
              margin: EdgeInsets.symmetric(vertical: 20),
              width: double.infinity,
              color: Colors.grey[200],
              child: Image.asset(widget.image),
            ),
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 40, left: 14, right: 14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              widget.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                isFavorite = !isFavorite;
                              });
                            },
                            icon: Icon(
                              Icons.favorite_border,
                              color: isFavorite ? Colors.red : null,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Per KG",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 50,
                                height: 40,
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  child: IconButton(
                                    onPressed: () {
                                      decrementCounter();
                                    },
                                    icon: Icon(Icons.remove),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(60),
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                ),
                                child: Text(
                                  "1",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              SizedBox(
                                width: 40,
                                height: 40,
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  child: IconButton(
                                    onPressed: () {
                                      incrementCounter();
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 180,
                              ),
                              Text(
                                "Rs 100",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(thickness: 1),
                      SizedBox(height: 5),
                      Text(
                        widget.description,
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Divider(thickness: 1),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Nutritions",
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
                                  "${widget.nutrition}gm",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    width: 60,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Product added to cart'),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
              child: Text("Add to Cart"),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
