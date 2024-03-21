import 'package:flutter/material.dart';
import 'package:keyboard/Pages/Product_Details.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourites'),
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetails(
                    name: 'Apple',
                    image: 'assets/apple.png',
                    price: 10,
                    description: 'Description of Apple',
                    nutrition: 'Nutrition information of Apple',
                    isFavorite: true, // Example value for isFavorite
                  ),
                ),
              );
            },
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/apple.png'),
            ),
            title: Text('Apple'),
            trailing: IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                // Add onPressed logic here
              },
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetails(
                    name: 'Avocado',
                    image: 'assets/avocado.png',
                    price: 15,
                    description: 'Description of Avocado',
                    nutrition: 'Nutrition information of Avocado',
                    isFavorite: false, // Example value for isFavorite
                  ),
                ),
              );
            },
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/avocado.png'),
            ),
            title: Text('Avocado'),
            trailing: IconButton(
              icon: Icon(Icons.favorite_border),
              onPressed: () {
                // Add onPressed logic here
              },
            ),
          ),
          // Add more list items as needed
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Favourite(),
  ));
}
