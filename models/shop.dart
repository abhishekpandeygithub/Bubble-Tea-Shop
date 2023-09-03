import 'package:flutter/cupertino.dart';

import 'drink.dart';

class BubbleTeaShop extends ChangeNotifier{

 // 1 list of drink for sale
  final List<Drink> drink =[

    Drink(
      name: 'Pearl Milk Tea',
      price: '5.00',
      imgPath: 'lib/images/milktea.png',
      color: Color(0xFF795548),
    ),
    Drink(
      name: 'BUTTERFLY FLOWER PEA MILK TEA',
      price: '5.00',
      imgPath: 'lib/images/butterflytea.png',
      color: Color(0xFF03A9F4),
    ),
    Drink(
      name: 'Purpule milk shake',
      price: '10.0',
      imgPath: 'lib/images/purpul.png',
      color: Color(0xFF9575CD),
    ),
    Drink(
      name:'Cocktail Special Soft Drink',
      price: '15.00',
      imgPath: 'lib/images/Cocktail.png',
      color: Color(0xFF40C4FF),
    ),
    Drink(
      name:'Cocktail Special Soft Drink',
      price: '15.00',
      imgPath: 'lib/images/Cocktail2.png',
      color: Color(0xFFFF1744),
    ),
    Drink(
      name:'Special Juice',
      price: '10.00',
      imgPath: 'lib/images/juice.png',
      color: Color(0xFFFF4081),
    ),


  ];



 // List of drinks in user cark
 final List<Drink> _userCart=[];

 //get drink for sale
 List<Drink> get shop => drink ;

//get user cart
 List<Drink> get cart => _userCart;

 // add drink to cart

void addToCart(Drink drink){
  _userCart.add(drink);
  notifyListeners();
}

  // remove drink to cart
 void removeFromCart(Drink drink){
  _userCart.remove(drink);
  notifyListeners();
 }

}