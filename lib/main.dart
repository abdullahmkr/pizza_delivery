import 'package:flutter/material.dart';
import 'package:pizza_app/menu_page.dart';

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
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 2.5 * 3.2, // Full rotation (2π radians)
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SlideTransition(
          position: _slideAnimation,
          child: RotationTransition(
            turns: _rotationAnimation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("lib/pizza_logo.png", height: 150),
                SizedBox(height: 20),
                Text(
                  "Pizza Delivery App",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 12)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MenuPage()));
                    },
                    child: Text(
                      "Get Started",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
