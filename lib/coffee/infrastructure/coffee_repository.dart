import 'dart:math';

import 'package:challenge_coffee/coffee/domain/models/coffee.dart';
import 'package:challenge_coffee/coffee/domain/usecases/i_coffees.dart';

class CoffeeRepository implements ICoffees {
  double _doubleInRange(Random source, num start, num end) =>
      source.nextDouble() * (end - start) + start;

  final _coffeesNames = [
    'Caramel Macchiato',
    'Caramel Cold Drink',
    'Iced Coffe Mocha',
    'Caramelized Pecan Latte',
    'Toffee Nut Latte',
    'Capuchino',
    'Toffee Nut Iced Latte',
    'Americano',
    'Vietnamese-Style Iced Coffee',
    'Black Tea Latte',
    'Classic Irish Coffee',
    'Toffee Nut Crunch Latte',
  ];

  @override
  List<Coffee> get() {
    final random = Random();
    final coffees = List.generate(
      _coffeesNames.length,
      (index) => Coffee(
        name: _coffeesNames[index],
        image: 'assets/images/${index + 1}.png',
        price: _doubleInRange(random, 3, 7),
      ),
    );

    return coffees;
  }
}
