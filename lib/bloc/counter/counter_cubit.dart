import 'package:flutter_hydrated_bloc/bloc/counter/counter_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class CounterCubit extends Cubit<CounterState> with HydratedMixin {
  CounterCubit() : super(CounterState(value: 0));

  void increment() => emit(CounterState(value: state.value + 1));

  void decrement() => emit(CounterState(value: state.value - 1));

  void reset() => emit(CounterState(value: 0));

  @override
  CounterState fromJson(Map<String, dynamic> json) {
    return CounterState.fromMap(json);
  }

  @override
  Map<String, dynamic> toJson(CounterState state) {
    return state.toMap();
  }
}
