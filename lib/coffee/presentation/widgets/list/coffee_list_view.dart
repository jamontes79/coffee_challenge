import 'package:challenge_coffee/coffee/application/list/coffee_list_bloc.dart';
import 'package:challenge_coffee/coffee/presentation/widgets/list/coffee_carousel.dart';
import 'package:challenge_coffee/coffee/presentation/widgets/list/title_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoffeeListView extends StatelessWidget {
  const CoffeeListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<CoffeeListBloc, CoffeeListState>(
      builder: (context, state) {
        return Stack(
          children: const [
            CoffeeCarousel(),
            Positioned(
              top: 10,
              left: 0,
              right: 0,
              height: 100,
              child: TitleCarousel(),
            ),
          ],
        );
      },
    );
  }
}
