import 'package:bubble_tea_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/drink.dart';

class OrderPage extends StatefulWidget {
  final Drink drink;

  const OrderPage({
    super.key,
    required this.drink,
  });

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  // for sweet value
  double sweetValue = 0.5;

  void costumizeSweet(double newValue) {
    setState(() {
      sweetValue = newValue;
    });
  }

  //for ice value
  double iceValue = 0.5;

  void costumizeIce(double newValue) {
    setState(() {
      iceValue = newValue;
    });
  }

  // for perl value
  double pearlValue = 0.5;

  void costumizePearl(double newValue) {
    setState(() {
      pearlValue = newValue;
    });
  }

//  call add to cart
  void addToCart() {
    //firstly , add to cart
    Provider.of<BubbleTeaShop>(context, listen: false).addToCart(widget.drink);

    // direct user back to shopPage
    Navigator.pop(context);

    // show dialog to successfully added to the cart
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              title: Text('Successfully added to Cart 🤎'),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.brown[100],
          appBar: AppBar(
            title: Text(widget.drink.name),
          ),
          body: Column(
            children: [
              // drink img
              Container(
                height: 500,
                width: 400,
                child: Image.asset(
                  widget.drink.imgPath,
                  fit: BoxFit.fill,
                ),
              ),

              //slider to customise drink
              Padding(
                padding: const EdgeInsets.all(35.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(width: 100, child: Text('Sweet')),
                        Expanded(
                          child: Slider(
                              label: sweetValue.toString(),
                              divisions: 4,
                              value: sweetValue,
                              onChanged: (value) {
                                costumizeSweet(value);
                              }),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(width: 100, child: Text('Ice')),
                        Expanded(
                          child: Slider(
                              label: iceValue.toString(),
                              divisions: 4,
                              value: iceValue,
                              onChanged: (value) {
                                costumizeIce(value);
                              }),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(width: 100, child: Text('Pearl')),
                        Expanded(
                          child: Slider(
                              label: pearlValue.toString(),
                              divisions: 4,
                              value: pearlValue,
                              onChanged: (value) {
                                costumizePearl(value);
                              }),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // add to cart button

              MaterialButton(
                child: Text(
                  'ADD to Cart',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.brown,
                onPressed: addToCart,
              )
            ],
          ),
        ),
      ],
    );
  }
}
