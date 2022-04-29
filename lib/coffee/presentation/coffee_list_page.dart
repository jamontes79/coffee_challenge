import 'package:challenge_coffee/coffee/presentation/widgets/list/coffee_list_view.dart';
import 'package:flutter/material.dart';

class CoffeeListPageST extends StatelessWidget {
  const CoffeeListPageST({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: const CoffeeListView(),
    );
  }
}
