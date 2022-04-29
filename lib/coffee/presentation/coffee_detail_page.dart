import 'package:challenge_coffee/coffee/domain/models/coffee.dart';
import 'package:challenge_coffee/coffee/presentation/widgets/detail/cofee_title.dart';
import 'package:challenge_coffee/coffee/presentation/widgets/detail/coffee_image.dart';
import 'package:challenge_coffee/coffee/presentation/widgets/detail/coffee_price_with_shadow.dart';
import 'package:flutter/material.dart';

class CoffeeDetailPage extends StatelessWidget {
  const CoffeeDetailPage({Key? key, required this.coffee}) : super(key: key);
  final Coffee coffee;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CoffeeTitle(coffee: coffee),
          const SizedBox(height: 30),
          SizedBox(
            height: size.height * 0.4,
            child: Stack(
              children: [
                CoffeeImage(coffee: coffee),
                Positioned(
                  left: size.width * 0.05,
                  bottom: 0,
                  child: TweenAnimationBuilder<double>(
                    tween: Tween(begin: 1, end: 0),
                    duration: const Duration(milliseconds: 500),
                    builder: (context, value, child) {
                      return Transform.translate(
                        offset: Offset(-100 * value, 240 * value),
                        child: child,
                      );
                    },
                    child: CoffeePriceWithShadow(coffee: coffee),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
