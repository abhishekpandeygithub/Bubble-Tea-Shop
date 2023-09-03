import 'package:flutter/material.dart';

import '../models/drink.dart';

class DrinkTile extends StatelessWidget {

  void Function()? onTap;

  final Drink drink;
  final Widget trailing;

   DrinkTile({
    super.key,
    required this.drink,
    required this.onTap,
     required this.trailing,
  }) ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: onTap,
      child: Container(
        height: 100,
        width: 100,

        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: Colors.brown[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          title: Text(drink.name),
          subtitle: Text(drink.price),
          leading: Image.asset(drink.imgPath),
          trailing: trailing,
        ),
      ),
    );
  }
}
