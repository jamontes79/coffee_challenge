import 'package:challenge_coffee/coffee/domain/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeePriceWithShadow extends StatelessWidget {
  const CoffeePriceWithShadow({
    Key? key,
    required this.coffee,
  }) : super(key: key);

  final Coffee coffee;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${coffee.price.toStringAsFixed(2)}'
      ' €',
      style: const TextStyle(
        fontSize: 50,
        fontWeight: FontWeight.w900,
        color: Colors.white,
        shadows: [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 10,
            spreadRadius: 20,
          ),
        ],
      ),
    );
  }
}
