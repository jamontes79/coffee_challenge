import 'package:challenge_coffee/coffee/domain/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeePrice extends StatelessWidget {
  const CoffeePrice({
    Key? key,
    required this.coffee,
  }) : super(key: key);

  final Coffee? coffee;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: Text(
        '${coffee?.price.toStringAsFixed(2)} €',
        key: Key(coffee?.name ?? ''),
        textAlign: TextAlign.center,
        maxLines: 2,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
