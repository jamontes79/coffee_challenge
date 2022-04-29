import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:challenge_coffee/coffee/domain/models/coffee.dart';
import 'package:challenge_coffee/coffee/domain/usecases/i_coffees.dart';
import 'package:equatable/equatable.dart';

part 'coffee_list_event.dart';
part 'coffee_list_state.dart';

class CoffeeListBloc extends Bloc<CoffeeListEvent, CoffeeListState> {
  CoffeeListBloc(this.coffeesRepository)
      : super(
          const CoffeeListState(
            coffees: <Coffee>[],
            currentPage: -1,
          ),
        ) {
    on<LoadCoffeesList>(_onLoadCoffeesList);
    on<CoffeesListPageChanged>(_onCoffeesListPageChanged);
  }
  final ICoffees coffeesRepository;
  FutureOr<void> _onLoadCoffeesList(
    LoadCoffeesList event,
    Emitter<CoffeeListState> emit,
  ) {
    final coffees = coffeesRepository.get();
    emit(
      state.copyWith(
        coffees: coffees,
        currentPage: 0,
      ),
    );
  }

  FutureOr<void> _onCoffeesListPageChanged(
    CoffeesListPageChanged event,
    Emitter<CoffeeListState> emit,
  ) {
    emit(
      state.copyWith(
        currentPage: event.page,
      ),
    );
  }
}
