import 'package:flutter/material.dart';
import 'package:keyboard/checkout/checkout.dart';
import '../Widgets/Navbar.dart';

class CartItem {
  final String name;
  final String icon;
  int qty;
  final String unit;
  final int unitPrice;

  CartItem({
    required this.name,
    required this.icon,
    required this.qty,
    required this.unit,
    required this.unitPrice,
  });
}

class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  List<CartItem> cart = [
    CartItem(
      name: "Apple",
      icon: "assets/apple.png",
      qty: 3,
      unit: "1kg, Price",
      unitPrice: 150,
    ),
    CartItem(
      name: "Starfruit",
      icon: "assets/starfruit.png",
      qty: 2,
      unit: "1kg, Price",
      unitPrice: 450,
    ),
    CartItem(
      name: "Spinach",
      icon: "assets/spinach.png",
      qty: 1,
      unit: "1kg, Price",
      unitPrice: 120,
    ),
  ];

  void incrementCounter(int index) {
    setState(() {
      cart[index].qty++;
    });
  }

  void decrementCounter(int index) {
    setState(() {
      if (cart[index].qty > 1) {
        cart[index].qty--;
      }
    });
  }

  void removeItem(int index) {
    setState(() {
      cart.removeAt(index);
    });
  }

  int getSubtotal() {
    int subtotal = 0;
    for (var item in cart) {
      subtotal += item.qty * item.unitPrice;
    }
    return subtotal;
  }

  int getShippingCost(int subtotal) {
    if (subtotal > 1000) {
      return 0;
    } else if (subtotal <= 1000 && subtotal > 100) {
      return 100;
    } else {
      return 120;
    }
  }

  @override
  Widget build(BuildContext context) {
    int subtotal = getSubtotal();
    int shippingCost = getShippingCost(subtotal);
    int totalPrice = subtotal + shippingCost; // Calculate total price

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: true,
        title: Text(
          "My Cart",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: cart.length,
              itemBuilder: (context, index) {
                var item = cart[index];
                return Column(
                  children: [
                    ListTile(
                      leading: SizedBox(
                        width: 60,
                        height: 60,
                        child: Image.asset(
                          item.icon,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      title: Row(
                        children: [
                          Expanded(
                            child: Text(
                              item.name,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () {
                              removeItem(index);
                            },
                          ),
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${item.qty} kg, ',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 40,
                                    height: 40,
                                    child: IconButton(
                                      onPressed: () {
                                        decrementCounter(index);
                                      },
                                      icon: Icon(Icons.remove),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(12),
                                    child: Text(
                                      item.qty.toString(),
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40,
                                    height: 40,
                                    child: IconButton(
                                      onPressed: () {
                                        incrementCounter(index);
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "Rs ${item.qty * item.unitPrice}",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(), // Divider between items
                  ],
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal:',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  Text(
                    'Rs $subtotal',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Shipping Cost:',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  Text(
                    'Rs $shippingCost',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total:',
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  Text(
                    'Rs $totalPrice', // Display total price
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Checkout(totalPrice: totalPrice),
                    ),
                  );
                },
                child: Text(
                  "Go To Checkout",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[400],
                  padding: EdgeInsets.only(left: 100, right: 100),
                  textStyle: TextStyle(fontSize: 20),
                  elevation: 20,
                  shadowColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBarWidget(),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MyCart(),
  ));
}
