import 'package:challenge_coffee/coffee/domain/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeTitle extends StatelessWidget {
  const CoffeeTitle({
    Key? key,
    required this.coffee,
  }) : super(key: key);

  final Coffee coffee;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.2),
      child: Hero(
        tag: 'text_${coffee.name}',
        child: Material(
          child: Text(
            coffee.name,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
