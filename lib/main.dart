import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard/Login/LOgin.dart';
import 'package:keyboard/Login/Reset.dart';
import 'package:keyboard/Login/success.dart';
import 'package:keyboard/Pages/homepage.dart';
import 'package:keyboard/Providers/LoginModel.dart';
import 'package:keyboard/Screens/Splash.dart';
import 'package:keyboard/cart/my_cart_view.dart';
import 'package:keyboard/controller/Buy_Product_Controller.dart';
import 'package:keyboard/controller/authentication_controller.dart';
import 'package:keyboard/controller/cart_controller.dart';
import 'package:keyboard/controller/getCategoryController.dart';
import 'package:keyboard/controller/getProduct_controller.dart';
import 'package:keyboard/controller/myOrders_Controller.dart';
import 'package:keyboard/controller/wishlist_controller.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ProductController());

  Get.put(AuthenticationController());
  Get.put(WishlistController());
  Get.put(CartController());
  Get.put(GetCategoryController());
  Get.put(BuyController());
  Get.put(MyOrder());

  runApp(const GetMaterialApp(
    home: LoginPage(),
  )
      // MultiProvider(
      //   providers: [
      //     ChangeNotifierProvider(create: (context) => LoginModel()),
      //   ],
      //   child: MaterialApp(
      //     title: 'Your App Title',
      //     theme: ThemeData(
      //       colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      //       useMaterial3: true,
      //     ),
      //     initialRoute: '/splash', // Add the initial route
      //     routes: {
      //       '/splash': (context) => Splash(), // Splash screen route
      //       '/resetPassword': (context) =>
      //           ResetPassword(), // Reset password screen route
      //       '/success': (context) => Success(), // Success screen route
      //       '/mycart': (context) => MyCart(), // MyCart screen route
      //     },
      //   ),
      // ),
      );
}
