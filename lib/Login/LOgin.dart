import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard/Login/Signup.dart';
import 'package:keyboard/Login/forgotpassword.dart';
import 'package:keyboard/Pages/homepage.dart';
import 'package:keyboard/controller/authentication_controller.dart';
import 'package:keyboard/controller/getProduct_controller.dart';
import 'package:keyboard/controller/get_banner_controller.dart';

import 'package:keyboard/newAdded/CustomValidator.dart';
import 'package:keyboard/newAdded/loading_dialog.dart';
import 'package:keyboard/newAdded/toast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscureText = true;
  void initState() {
    super.initState();
    Get.find<GetBannersController>().fetchBanners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Colors.green[300] ?? Colors.green,
                Colors.green[600] ?? Colors.green,
                Colors.green[900] ?? Colors.green,
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Welcome Back",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: MediaQuery.of(context).size.height - 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 18),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 60,
                        ),
                        TextFormField(
                          validator: (value) => Validator.validateEmail(value!),
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: "Enter your email",
                            hintText: "your email",
                            prefixIcon:
                                Icon(Icons.email, semanticLabel: 'Email'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: passwordController,
                          obscureText: obscureText,
                          decoration: InputDecoration(
                            labelText: "Enter your password",
                            hintText: "your password",
                            prefixIcon:
                                Icon(Icons.lock, semanticLabel: 'Password'),
                            suffixIcon: IconButton(
                              icon: Icon(
                                obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  obscureText = !obscureText;
                                });
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password is required';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // Align(
                        //   alignment: Alignment.centerRight,
                        //   child: TextButton(
                        //     onPressed: () {
                        //       Navigator.of(context).push(
                        //         MaterialPageRoute(
                        //           builder: (context) => ForgotPassword(),
                        //         ),
                        //       );
                        //     },
                        //     child: Text(
                        //       "Forgot Password?",
                        //       style: TextStyle(
                        //         fontSize: 15,
                        //         fontWeight: FontWeight.bold,
                        //         fontStyle: FontStyle.italic,
                        //         color: Colors.blue,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: ElevatedButton(
                            onPressed: () {
                              var isValid = formKey.currentState!.validate();
                              if (isValid) {
                                var data = {
                                  'email': emailController.text,
                                  'password': passwordController.text
                                };

                                Get.find<AuthenticationController>()
                                    .signIn(data, context);
                              }
                            },
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
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.normal,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 70,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Don't have an account?"),
                              TextButton(
                                onPressed: () {
                                  Get.to(SignupPage());
                                  // Implement the navigation logic for sign up
                                },
                                child: Text("Sign Up"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
