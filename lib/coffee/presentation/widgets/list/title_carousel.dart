import 'package:challenge_coffee/coffee/application/list/coffee_list_bloc.dart';
import 'package:challenge_coffee/coffee/domain/models/coffee.dart';
import 'package:challenge_coffee/coffee/presentation/widgets/list/coffee_price.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TitleCarousel extends StatelessWidget {
  const TitleCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _titleController = PageController();
    final size = MediaQuery.of(context).size;
    return BlocConsumer<CoffeeListBloc, CoffeeListState>(
      listener: (context, state) {
        if (_titleController.positions.isNotEmpty) {
          _titleController.animateToPage(
            state.currentPage.toInt(),
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
          );
        }
      },
      builder: (context, state) {
        if (state.currentPage == -1 || state.coffees.isEmpty) {
          return const CircularProgressIndicator();
        } else if (state.currentPage >= state.coffees.length) {
          return const SizedBox.shrink();
        }
        Coffee? coffee;
        if (state.currentPage < state.coffees.length) {
          coffee = state.coffees[state.currentPage.toInt()];
        }
        return TweenAnimationBuilder<double>(
          tween: Tween(begin: 1, end: 0),
          duration: const Duration(milliseconds: 1000),
          builder: (context, value, child) {
            return Transform.translate(
              offset: Offset(0, -100 * value),
              child: child,
            );
          },
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: state.coffees.length,
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _titleController,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.2,
                      ),
                      child: Text(
                        state.coffees[index].name,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    );
                  },
                ),
              ),
              CoffeePrice(coffee: coffee),
            ],
          ),
        );
      },
    );
  }
}
