import 'package:bubble_tea_app/components/drink_tile.dart';
import 'package:bubble_tea_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/drink.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  void removeFromCart(Drink drink){
    Provider.of<BubbleTeaShop>(context,listen: false).removeFromCart(drink);
  }

  @override
  Widget build(BuildContext context) {
    return  Consumer<BubbleTeaShop>(builder:(context, value, child) => SafeArea(
      child: Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          children: [
            // heading
            Text('Your Cart',style: TextStyle(fontSize: 30),),

            SizedBox(height: 15,),

            // leat of cart items
            Expanded(
              child: ListView.builder(
                itemCount: value.cart.length,
                  itemBuilder: (context , index){
                    // get individual in cart first
                    Drink drink = value.cart[index];
                    //return as a nice drink Tile
                   return DrinkTile(drink: drink, onTap:()=> removeFromCart(drink), trailing: Icon(Icons.delete));

                  }

              ),
            ),

            MaterialButton(
              child: Text('Pay',style: TextStyle(color: Colors.white),),

              color: Colors.brown,
              onPressed: (){},
            )

          ],
        ),
      ),
    ),
    );

  }
}

