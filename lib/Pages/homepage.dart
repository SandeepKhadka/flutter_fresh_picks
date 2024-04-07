import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard/Pages/Drawer.dart';
import 'package:keyboard/Widgets/BestSelling.dart';
import 'package:keyboard/Widgets/Carousel.dart';
import 'package:keyboard/Widgets/Exotic.dart';
import 'package:keyboard/Widgets/Navbar.dart';
import 'package:keyboard/Widgets/ProductWidget.dart';
import 'package:keyboard/controller/getProduct_controller.dart';
import 'package:keyboard/controller/user_Controller.dart';
import 'package:keyboard/model/getProducts_model.dart';
import 'package:keyboard/payment/khalti.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    print(Get.find<ProductController>().get());
    print(Get.find<ProductController>().getExoticProduct());
  }

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.put(UserController());
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.to(KhaltiExampleApp());
                  },
                  child: Text(Get.find<UserController>().userName),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(SearchPage());
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                "Search Your Groceries",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                MySlider(),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 10),
                  child: Text(
                    "Exotic Items",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                ExoticItemWidget(),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 10),
                  child: Text(
                    "Best Selling",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                BestSelling(),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 10),
                  child: Text(
                    "Discount Price",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                ProductItemWidget(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBarWidget(),
      drawer: Drawer(
        child: CustomDrawer(),
      ),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../controller/getProduct_controller.dart';
// import '../model/getProducts_model.dart';

// class SearchPage extends StatefulWidget {
//   const SearchPage({Key? key}) : super(key: key);

//   @override
//   _SearchPageState createState() => _SearchPageState();
// }

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<GetProducts> _products = [];
  List<GetProducts> _searchResults = [];

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  void _fetchProducts() async {
    try {
      _products = await Get.find<ProductController>().get();
    } catch (e) {
      print('Error fetching products: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search Products...',
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                _searchController.clear();
                _updateSearchResults('');
              },
            ),
          ),
          onChanged: _updateSearchResults,
        ),
      ),
      body: ListView.builder(
        itemCount: _searchResults.length,
        itemBuilder: (context, index) {
          final product = _searchResults[index];
          return ListTile(
            title: Text(product.name),
            onTap: () {
              // Handle tapping on search result
            },
          );
        },
      ),
    );
  }

  void _updateSearchResults(String query) {
    setState(() {
      _searchResults = _products
          .where((product) =>
              product.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }
}






// class _SearchPageState extends State<SearchPage> {
//   final TextEditingController _searchController = TextEditingController();
//   late List<GetProducts> _products = [];
//   List<GetProducts> _searchResults = [];

//   @override
//   void initState() {
//     super.initState();
//     _fetchProducts();
//   }

//   void _fetchProducts() async {
//     try {
//       _products = await Get.find<ProductController>().get();
//     } catch (e) {
//       print('Error fetching products: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: TextField(
//           controller: _searchController,
//           decoration: InputDecoration(
//             hintText: 'Search Products...',
//             border: InputBorder.none,
//             suffixIcon: IconButton(
//               icon: Icon(Icons.clear),
//               onPressed: () {
//                 _searchController.clear();
//                 _updateSearchResults('');
//               },
//             ),
//           ),
//           onChanged: _updateSearchResults,
//         ),
//       ),
//       body: ListView.builder(
//         itemCount: _searchResults.length,
//         itemBuilder: (context, index) {
//           final product = _searchResults[index];
//           return ListTile(
//             title: Text(product.name),
//             onTap: () {
//               // Handle tapping on search result
//             },
//           );
//         },
//       ),
//     );
//   }

//   void _updateSearchResults(String query) {
//     _searchResults.clear();
//     if (query.isEmpty) {
//       setState(() {});
//       return;
//     }
//     _searchResults = _products.where((product) {
//       final productName = product.name.toLowerCase();
//       final searchQuery = query.toLowerCase();
//       return productName.contains(searchQuery);
//     }).toList();
//     setState(() {});
//   }
// }
