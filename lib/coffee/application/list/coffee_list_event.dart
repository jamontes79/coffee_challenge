part of 'coffee_list_bloc.dart';

abstract class CoffeeListEvent extends Equatable {
  const CoffeeListEvent();
}

class LoadCoffeesList extends CoffeeListEvent {
  const LoadCoffeesList();

  @override
  List<Object?> get props => [];
}

class CoffeesListPageChanged extends CoffeeListEvent {
  const CoffeesListPageChanged(this.page);
  final double page;
  @override
  List<Object?> get props => [page];
}
