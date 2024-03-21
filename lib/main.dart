import 'package:flutter/material.dart';
import 'package:keyboard/Login/Reset.dart';
import 'package:keyboard/Login/success.dart';
import 'package:keyboard/Providers/LoginModel.dart';
import 'package:keyboard/Screens/Splash.dart';
import 'package:keyboard/cart/my_cart_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginModel()),
      ],
      child: MaterialApp(
        title: 'Your App Title',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          useMaterial3: true,
        ),
        initialRoute: '/splash', // Add the initial route
        routes: {
          '/splash': (context) => Splash(), // Splash screen route
          '/resetPassword': (context) =>
              ResetPassword(), // Reset password screen route
          '/success': (context) => Success(), // Success screen route
          '/mycart': (context) => MyCart(), // MyCart screen route
        },
      ),
    ),
  );
}
