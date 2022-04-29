import 'package:challenge_coffee/coffee/application/list/coffee_list_bloc.dart';
import 'package:challenge_coffee/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoffeeCarousel extends StatelessWidget {
  const CoffeeCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _pageCoffeeController = PageController(
      viewportFraction: 0.35,
    );

    _pageCoffeeController.addListener(() {
      context.read<CoffeeListBloc>().add(
            CoffeesListPageChanged(
              _pageCoffeeController.page ?? 0,
            ),
          );
    });
    final size = MediaQuery.of(context).size;
    return BlocBuilder<CoffeeListBloc, CoffeeListState>(
      builder: (context, state) {
        return Stack(
          children: [
            Positioned(
              left: 20,
              bottom: -size.height * 0.22,
              right: 20,
              height: size.height * 0.3,
              child: const DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.brown,
                      blurRadius: 90,
                      spreadRadius: 45,
                    ),
                  ],
                ),
              ),
            ),
            Transform.scale(
              scale: 1.6,
              alignment: Alignment.bottomCenter,
              child: PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: state.coffees.length + 1,
                controller: _pageCoffeeController,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return const SizedBox.shrink();
                  }
                  final result = state.currentPage - index + 1;

                  final value = -0.4 * result + 1;
                  final opacity = value.clamp(0.0, 1.0);
                  final coffee = state.coffees[index - 1];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Transform(
                      alignment: Alignment.bottomCenter,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..translate(
                          0.0,
                          size.height / 2.6 * (1 - value).abs(),
                        )
                        ..scale(value),
                      child: Opacity(
                        opacity: opacity,
                        child: GestureDetector(
                          onTap: result == 0.0
                              ? () {
                                  Navigator.pushNamed(
                                    context,
                                    RouteGenerator.detailPage,
                                    arguments: coffee,
                                  );
                                }
                              : null,
                          child: Hero(
                            tag: 'image_${coffee.name}',
                            child: Image.asset(
                              coffee.image,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
