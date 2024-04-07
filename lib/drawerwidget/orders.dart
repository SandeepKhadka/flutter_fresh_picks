import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:keyboard/controller/myOrders_Controller.dart';
import 'package:keyboard/controller/user_Controller.dart';
import 'package:keyboard/model/getOrder_model.dart';

import '../checkout/final_order.dart'; // Assuming Order class is defined here
// Importing OrderTimeline widget

enum Action { delete }

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  void initState() {
    Get.find<MyOrder>().GetMyOrders(Get.find<UserController>().id);

    // Perform initialization tasks here
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Your orders'),
      ),
      body: Obx(
        () {
          if (Get.find<MyOrder>().isLoading.value) {
            // Show circular progress indicator while loading
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return SingleChildScrollView(
              child: GetBuilder<MyOrder>(
                builder: (_) => ListView.builder(
                  itemCount: _.getMyOrders.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        // Show additional details in a dialog
                        _showOrderDetailsDialog(_.getMyOrders[index]);
                      },
                      child: Card(
                        margin: EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text(
                            'Order Number: ${_.getMyOrders[index].orderNumber}',
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Delivery Address: ${_.getMyOrders[index].deliveryAddress}',
                              ),
                              Text(
                                'Total Amount: ${_.getMyOrders[index].totalAmount}',
                              ),
                            ],
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          }
        },
      ),
    );
  }

  void _showOrderDetailsDialog(Order order) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Order Details'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Order Number: ${order.orderNumber}'),
                Text('Delivery Address: ${order.deliveryAddress}'),
                Text('Delivery Charge: ${order.deliveryCharge}'),
                Text('Total Amount: ${order.totalAmount}'),
                Text('Payment Method: ${order.paymentMethod}'),
                Text('Payment Status: ${order.paymentStatus}'),
                Text('ID: ${order.id}'),
                Text('Condition: ${order.condition}'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
