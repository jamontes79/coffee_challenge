import 'package:challenge_coffee/coffee/domain/models/coffee.dart';
import 'package:challenge_coffee/coffee/presentation/coffee_detail_page.dart';
import 'package:challenge_coffee/coffee/presentation/coffee_home.dart';
import 'package:challenge_coffee/coffee/presentation/coffee_list_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static const String mainPage = '';
  static const String listPage = 'list';
  static const String detailPage = 'detail';
  static Route<MaterialPageRoute> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainPage:
        return MaterialPageRoute(
          builder: (_) => const CoffeeHome(
            key: Key('home_page'),
          ),
        );

      case listPage:
        return MaterialPageRoute(
          builder: (_) => const CoffeeListPageST(
            key: Key('list_page'),
          ),
        );
      case detailPage:
        final coffee = settings.arguments! as Coffee;
        return MaterialPageRoute(
          builder: (_) => CoffeeDetailPage(
            key: const Key('detail_page'),
            coffee: coffee,
          ),
        );
      default:
        throw const FormatException('Route not found');
    }
  }
}
