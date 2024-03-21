import 'package:flutter/material.dart';
import '../Pages/Product_Details.dart';

class ExoticItemWidget extends StatelessWidget {
  final List<String> productNames = [
    "Dragon Fruit",
    "Lotus Root",
    "Avocado",
    "Rambutan",
    "Passion Feijoa",
    "Kiwano",
    "Mangosteen",
    "Tatusi",
    "Romanesco",
    "Durian"
  ];

  final List<String> productImages = [
    "assets/df.png",
    "assets/lotus.png",
    "assets/avacado.png",
    "assets/5.png",
    "assets/7.png",
    "assets/kiwano.png",
    "assets/mangosteen.png",
    "assets/tatusi.png",
    "assets/romanesco.png",
    "assets/durian.png"
  ];

  final List<String> productDescriptions = [
    "Dragon fruit is a tropical fruit known for its vibrant red skin and sweet, kiwi-like flesh speckled with small black seeds. It is rich in antioxidants and vitamins.",
    "Lotus root is a vegetable commonly used in Asian cuisine. It has a crunchy texture and a slightly sweet taste. It is often used in soups, stir-fries, and salads.",
    "Avocado is a creamy fruit with a buttery texture and a rich flavor. It is packed with healthy fats, vitamins, and minerals, making it a nutritious addition to salads, sandwiches, and smoothies.",
    "Rambutan is a tropical fruit native to Southeast Asia. It has a hairy red or yellow skin and a sweet, juicy flesh. It is often eaten fresh or used in desserts and beverages.",
    "Passion feijoa, also known as pineapple guava, is a tropical fruit with a sweet and tangy flavor. It is rich in vitamin C and fiber, and it can be eaten fresh or used in jams and desserts.",
    "Kiwano, also known as horned melon, is a unique fruit with spiky orange skin and green jelly-like flesh. It has a refreshing, slightly tart flavor and can be eaten fresh or added to fruit salads and cocktails.",
    "Mangosteen is a tropical fruit known for its sweet and tangy flavor. It has a thick purple rind and soft white flesh. Mangosteen is rich in antioxidants and vitamins.",
    "Tatusi, also known as soursop or graviola, is a tropical fruit with a prickly green skin and creamy white flesh. It has a sweet and tangy flavor and is often used in smoothies, juices, and desserts.",
    "Romanesco, also known as Roman cauliflower, is a unique vegetable with a fractal-like appearance. It has a nutty flavor and a crunchy texture. Romanesco can be roasted, steamed, or sautéed.",
    "Durian is a tropical fruit known for its strong odor and unique flavor. It has a custard-like texture and a sweet, creamy taste with hints of almond and vanilla. Durian is often called the 'king of fruits' in Southeast Asia."
  ];

  final List<String> productNutritions = [
    "100",
    "200",
    "150",
    "120",
    "80",
    "90",
    "110",
    "130",
    "180",
    "160"
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        child: Row(
          children: List.generate(productNames.length, (index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetails(
                      name: productNames[index],
                      image: productImages[index],
                      price: (index + 1) * 100, // Example price calculation
                      description: productDescriptions[index],
                      nutrition: productNutritions[index],
                      isFavorite: false,
                    ),
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 7),
                child: Container(
                  width: 170,
                  height: 225,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Image.asset(
                            productImages[index],
                            height: 130,
                          ),
                        ),
                        Text(
                          productNames[index],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "1KG",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Rs ${(index + 1) * 100}", // Example price calculation
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.green[400],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.add_box_rounded,
                              color: Colors.green,
                              size: 30,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
