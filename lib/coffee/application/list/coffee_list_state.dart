part of 'coffee_list_bloc.dart';

class CoffeeListState extends Equatable {
  const CoffeeListState({
    required this.coffees,
    required this.currentPage,
  });
  final List<Coffee> coffees;
  final double currentPage;

  CoffeeListState copyWith({
    List<Coffee>? coffees,
    double? currentPage,
  }) {
    return CoffeeListState(
      coffees: coffees ?? this.coffees,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  @override
  List<Object> get props => [
        coffees,
        currentPage,
      ];
}
