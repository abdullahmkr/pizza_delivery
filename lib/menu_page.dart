import 'package:flutter/material.dart';

void main() {
  runApp(PizzaDeliveryApp());
}

class PizzaDeliveryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizza Delivery App',
      theme: ThemeData(
        primaryColor: Colors.red,
        focusColor: Colors.yellow,
        fontFamily: 'Montserrat',
      ),
      home: MenuPage(),
    );
  }
}

class MenuPage extends StatelessWidget {
  final List<PizzaItem> popularPizzas = [
    PizzaItem(
      title: 'Margherita Pizza',
      description:
          'Classic pizza topped with tomato sauce, mozzarella cheese, and basil.',
      price: '\$9.99',
      imagePath: 'lib/pizza.png',
    ),
    PizzaItem(
      title: 'Pepperoni Pizza',
      description:
          'Delicious pizza loaded with pepperoni slices and melted cheese.',
      price: '\$11.99',
      imagePath: 'lib/pizza.png',
    ),
    PizzaItem(
      title: 'Vegetarian Pizza',
      description:
          'Veggie-packed pizza with a variety of fresh vegetables and cheese.',
      price: '\$10.99',
      imagePath: 'lib/pizza.png',
    ),
  ];

  final List<PizzaItem> allPizzas = [
    PizzaItem(
      title: 'Hawaiian Pizza',
      description: 'A tropical twist with ham, pineapple, and cheese.',
      price: '\$12.99',
      imagePath: 'lib/pizza.png',
    ),
    PizzaItem(
      title: 'Chicken BBQ Pizza',
      description: 'Grilled chicken, BBQ sauce, and cheese on a thin crust.',
      price: '\$13.99',
      imagePath: 'lib/pizza.png',
    ),
    PizzaItem(
      title: 'Supreme Pizza',
      description:
          'Loaded with a variety of toppings including sausage, peppers, and olives.',
      price: '\$14.99',
      imagePath: 'lib/pizza.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset("lib/Menu.png", height: 40),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text(
                "Popular Pizza's",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Montserrat"),
              ),
            ),
            SizedBox(
              height: 260,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: popularPizzas.length,
                itemBuilder: (context, index) {
                  return PizzaCard(pizzaItem: popularPizzas[index]);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(14),
              child: Text(
                "All Pizza's",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Montserrat"),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 400,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: allPizzas.length,
                itemBuilder: (context, index) {
                  return PizzaCard(pizzaItem: allPizzas[index]);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          color: Colors.red,
          child: Container(
              height: 35,
              child: Center(
                  child: Container(
                      height: 35,
                      child: Text("Place Order",
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Montserrat")))))),
    );
  }
}

class PizzaItem {
  final String title;
  final String description;
  final String price;
  final String imagePath;

  PizzaItem({
    required this.title,
    required this.description,
    required this.price,
    required this.imagePath,
  });
}

class PizzaCard extends StatelessWidget {
  final PizzaItem pizzaItem;

  PizzaCard({required this.pizzaItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: Offset(0, 2),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              image: DecorationImage(
                image: AssetImage(pizzaItem.imagePath),
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: Icon(Icons.add_shopping_cart),
                  onPressed: () {
                    // Logic for adding to cart
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pizzaItem.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  pizzaItem.description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontFamily: 'Montserrat',
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  pizzaItem.price,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
