import 'package:bubble_tea_app/components/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

import 'CartPage.dart';
import 'ShopPage.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //navigate bottom bar
  int _selectedIndex = 0;
    void navigateBottomBar(int newIndex ){
      setState(() {
        _selectedIndex = newIndex;
      });
  }

  //pages to display
  final List<Widget> _pages =[
    //shop page
    ShopPage(),

    //cart Page
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.brown[200],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
