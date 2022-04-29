import 'package:challenge_coffee/coffee/application/list/coffee_list_bloc.dart';
import 'package:challenge_coffee/coffee/presentation/coffee_list_page.dart';
import 'package:challenge_coffee/coffee/presentation/widgets/home/background.dart';
import 'package:challenge_coffee/coffee/presentation/widgets/home/coffee_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoffeeHome extends StatelessWidget {
  const CoffeeHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          if ((details.primaryDelta ?? 1000) < -20) {
            Navigator.of(context).push(
              PageRouteBuilder<Material>(
                transitionDuration: const Duration(milliseconds: 650),
                pageBuilder: (context, animation, _) {
                  return FadeTransition(
                    opacity: animation,
                    child: const CoffeeListPageST(),
                  );
                },
              ),
            );
          }
        },
        child: BlocBuilder<CoffeeListBloc, CoffeeListState>(
          builder: (context, state) {
            if (state.coffees.isEmpty) {
              return const CircularProgressIndicator();
            }
            return Stack(
              children: [
                const Background(),
                CoffeeImage(
                  coffee: state.coffees[6],
                  heightScaleFactor: 0.4,
                ),
                CoffeeImage(
                  coffee: state.coffees[7],
                  heightScaleFactor: 0.7,
                  bottom: 0,
                  top: 0,
                  fit: BoxFit.cover,
                ),
                CoffeeImage(
                  coffee: state.coffees[8],
                  bottom: -size.height * 0.8,
                  top: 0,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  height: 140,
                  left: 0,
                  right: 0,
                  bottom: size.height * 0.25,
                  child: Image.asset(
                    'assets/images/logo.png',
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
