import 'package:challenge_coffee/coffee/domain/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeImage extends StatelessWidget {
  const CoffeeImage({
    Key? key,
    required this.coffee,
  }) : super(key: key);

  final Coffee coffee;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Hero(
        tag: 'image_${coffee.name}',
        child: Image.asset(
          coffee.image,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
