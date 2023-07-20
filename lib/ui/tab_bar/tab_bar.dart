import 'package:flutter/material.dart';
import 'package:third_exam/ui/all_products_page/all_products.dart';
import 'package:third_exam/ui/cart_page/cart_page.dart';
import 'package:third_exam/ui/home/home_page.dart';

class Tabscreen extends StatefulWidget {
  const Tabscreen({Key? key}) : super(key: key);

  @override
  State<Tabscreen> createState() => _TabscreenState();
}

class _TabscreenState extends State<Tabscreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const AllProducts(),
    const CartPage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.production_quantity_limits_sharp),
            label: 'All Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}
