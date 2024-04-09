import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard/Login/success.dart';
import 'package:keyboard/PlaceOrder/confirm.dart';
import 'package:keyboard/PlaceOrder/final_order.dart';
import 'package:keyboard/checkout/promocode.dart';
import 'package:keyboard/controller/user_Controller.dart';
import 'package:keyboard/model/userDetails.dart';
import 'package:keyboard/payment/khalti.dart';

import '../controller/Buy_Product_Controller.dart';

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
  final List<dynamic> productJsonData;

  const Checkout({
    Key? key,
    required this.totalPrice,
    required this.productJsonData,
  }) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  late TextEditingController addressController = TextEditingController();
  String selectedLocation = '';
  bool promoCodeApplied = false;
  double discountPercentage = 0.1; // 10% discount
  String paymentMethod = '';

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double discountedPrice = widget.totalPrice.toDouble();

    if (promoCodeApplied) {
      // Apply discount if promo code is applied
      discountedPrice -= widget.totalPrice * discountPercentage;
    }

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
      body: SingleChildScrollView(
        child: Padding(
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
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
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
                        _showAddressDialog();
                      },
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            selectedLocation.isNotEmpty
                                ? selectedLocation
                                : "Enter Address",
                            style: TextStyle(fontSize: 15, color: Colors.black),
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
                        _showPaymentOptions();
                      },
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            paymentMethod.isNotEmpty
                                ? paymentMethod
                                : "Select Payment Method",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
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
                        if (!promoCodeApplied) {
                          Get.to(PromoCode(
                            onApplyPromoCode: (promoCode) {
                              setState(() {
                                promoCodeApplied = true;
                              });
                            },
                          ));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(
                                    'Promo code already applied! Cannot apply more than once.')),
                          );
                        }
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
                            "Rs ${discountedPrice.toStringAsFixed(2)}",
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          Icon(Icons.arrow_forward_ios_rounded),
                        ],
                      ),
                    ),
                    if (promoCodeApplied)
                      ListTile(
                        title: Text(
                          "Promo Code Discount",
                          style: TextStyle(color: Colors.grey),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "10% P.C applied",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
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
                  if (selectedLocation.isNotEmpty && paymentMethod.isNotEmpty) {
                    if (paymentMethod == 'Khalti') {
                      print('Continue Khalti online');
                      Get.to(KhaltiExampleApp(totalPrice:discountedPrice,address: selectedLocation,productJsonData: widget.productJsonData,));
                      // Add your logic for Khalti payment continuation
                    } else {
                      print("Address: $selectedLocation");
                      print("Payment Method: $paymentMethod");
                      print("EVERYTHING WORK SUCCESSFULL");
                      var data = {
                        "user_id": Get.find<UserController>().id.toString(),
                        "payment_method": paymentMethod,
                        "total_amount": discountedPrice.toStringAsFixed(2),
                        "delivery_address": selectedLocation,
                        "products": widget.productJsonData
                      };
                      Get.put(BuyController().add(data));
                      Get.to(OrderSuccessful());
                    }
                  } else {
                    if (selectedLocation.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please enter address.'),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please select payment method.'),
                        ),
                      );
                    }
                  }
                },
                child: Text(
                  paymentMethod == 'Khalti' ? 'Continue Khalti' : 'Place Order',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showAddressDialog() async {
    final enteredAddress = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Enter Address"),
        content: TextField(
          controller: addressController,
          decoration: InputDecoration(
            hintText: "Enter your full address",
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                selectedLocation = addressController.text;
              });
              Navigator.pop(context, selectedLocation);
            },
            child: Text("Save"),
          ),
        ],
      ),
    );

    if (enteredAddress != null) {
      setState(() {
        selectedLocation = enteredAddress;
      });
    }
  }

  void _showPaymentOptions() async {
    final selectedPayment = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Select Payment Method"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  paymentMethod = "cod";
                });
                Navigator.pop(context, paymentMethod);
              },
              child: Text("cod"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  paymentMethod = "Khalti";
                });
                Navigator.pop(context, paymentMethod);
              },
              child: Text("Khalti"),
            ),
          ],
        ),
      ),
    );

    if (selectedPayment != null) {
      setState(() {
        paymentMethod = selectedPayment;
      });
    }
  }
}
