import 'package:challenge_coffee/coffee/domain/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeImage extends StatelessWidget {
  const CoffeeImage({
    Key? key,
    required this.coffee,
    this.heightScaleFactor = 1,
    this.bottom,
    this.top,
    this.fit,
  }) : super(key: key);
  final Coffee coffee;
  final double heightScaleFactor;
  final double? bottom;
  final double? top;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned(
      height: size.height * heightScaleFactor,
      left: 0,
      right: 0,
      bottom: bottom,
      top: top == null ? size.height * 0.15 : null,
      child: Hero(
        tag: 'image_${coffee.name}',
        child: Image.asset(
          coffee.image,
          fit: fit,
        ),
      ),
    );
  }
}
