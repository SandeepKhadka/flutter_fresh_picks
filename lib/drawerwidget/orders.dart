import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:keyboard/controller/myOrders_Controller.dart';
import 'package:keyboard/controller/user_Controller.dart';
import 'package:keyboard/model/getOrder_model.dart';

import '../checkout/final_order.dart';

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
                        // Navigate to order details page
                        Get.to(OrderDetails(order: _.getMyOrders[index]));
                      },
                      child: Card(
                        margin: EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text(
                            'Order Number: ${_.getMyOrders[index].orderNumber}',
                            style: TextStyle(fontWeight: FontWeight.bold),
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
}

class OrderDetails extends StatelessWidget {
  final Order order;

  const OrderDetails({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order Number: ${order.orderNumber}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text('Delivery Address: ${order.deliveryAddress}'),
            SizedBox(height: 8.0),
            Text('Total Amount: ${order.totalAmount}'),
            SizedBox(height: 16.0),
            OrderTimeline(order: order),
          ],
        ),
      ),
    );
  }
}

class OrderTimeline extends StatelessWidget {
  final Order order;

  const OrderTimeline({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Order Timeline',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: order.products.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                child: Text((index + 1).toString()),
              ),
              title: Text(order.products[index].name),
              subtitle:
                  Text("Quantity = " + order.products[index].quantity.toString()+ " KG"),
            );
          },
        ),
        Center(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[100],
                padding: EdgeInsets.only(left: 10, right: 10),
                textStyle: TextStyle(fontSize: 17),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
              onPressed: () {},
              child: Text("Condition = " + order.condition.toString())),
        )
      ],
    );
  }
}
