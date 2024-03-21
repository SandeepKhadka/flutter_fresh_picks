import 'package:flutter/material.dart';
import 'package:keyboard/PlaceOrder/final_order.dart';
import 'package:keyboard/checkout/delivery.dart';
import 'package:keyboard/checkout/promocode.dart';

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

class Checkout extends StatefulWidget {
  final int totalPrice;

  const Checkout({Key? key, required this.totalPrice}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  String selectedLocation = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  ListTile(
                    title: Text(
                      "Check Out",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    onTap: () => print("Delete"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.close),
                      ],
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text(
                      "Delivery",
                      style: TextStyle(color: Colors.grey),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SelectLocation()));
                    },
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          selectedLocation.isNotEmpty
                              ? selectedLocation
                              : "Select Method",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        Icon(Icons.arrow_forward_ios_rounded),
                      ],
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text(
                      "Payment",
                      style: TextStyle(color: Colors.grey),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Payment(
                                totalPrice: widget.totalPrice,
                                selectedLocation: selectedLocation)),
                      );
                    },
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset('assets/esewa1.png'),
                        Icon(Icons.arrow_forward_ios_rounded),
                      ],
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text(
                      "Promo Code",
                      style: TextStyle(color: Colors.grey),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => PromoCode()));
                    },
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Pick Discount",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        Icon(Icons.arrow_forward_ios_rounded),
                      ],
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text(
                      "Total Cost",
                      style: TextStyle(color: Colors.grey),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Rs ${widget.totalPrice}",
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        Icon(Icons.arrow_forward_ios_rounded),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 150,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          FinalOrder(selectedLocation: selectedLocation)));
                },
                child: Text('Place Order'))
          ],
        ),
      ),
    );
  }
}

class Payment extends StatefulWidget {
  final int totalPrice;
  final String selectedLocation;

  const Payment(
      {Key? key, required this.totalPrice, required this.selectedLocation})
      : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          'Payment ',
          style: TextStyle(color: Colors.green),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Select Payment Method',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
          Divider(),
          ListTile(
            leading: Radio(
              value: 0,
              groupValue: _selectedIndex,
              onChanged: (value) {
                setState(() {
                  _selectedIndex = value as int;
                });
              },
            ),
            title: Text('Khalti'),
            trailing: Icon(Icons.payment),
          ),
          Divider(),
          ListTile(
            leading: Radio(
              value: 1,
              groupValue: _selectedIndex,
              onChanged: (value) {
                setState(() {
                  _selectedIndex = value as int;
                });
              },
            ),
            title: Text('Esewa'),
            trailing: Icon(Icons.payment),
          ),
          Divider(),
          ListTile(
            leading: Radio(
              value: 2,
              groupValue: _selectedIndex,
              onChanged: (value) {
                setState(() {
                  _selectedIndex = value as int;
                });
              },
            ),
            title: Text('Cash on Delivery'),
            trailing: Icon(Icons.money),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        Checkout(totalPrice: widget.totalPrice),
                  ),
                );
              },
              child: Text(
                "PAY",
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
    );
  }
}

void main() {
  // Sample cart data
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

  // Calculate subtotal
  int subtotal = 0;
  for (var item in cart) {
    subtotal += item.qty * item.unitPrice;
  }

  // Calculate shipping cost
  int shippingCost =
      subtotal > 1000 ? 0 : (subtotal <= 1000 && subtotal > 100 ? 100 : 120);

  // Calculate total price
  int totalPrice = subtotal + shippingCost;

  // Run the app with the calculated total price
  runApp(MaterialApp(
    home: Checkout(totalPrice: totalPrice),
  ));
}
