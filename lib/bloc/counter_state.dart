part of 'counter_bloc.dart';

abstract class CounterState extends Equatable {
  const CounterState();
}

class CounterInitial extends CounterState {
  @override
  List<Object> get props => [];
}

class CounterValue extends CounterState {
  final int value;

  CounterValue(this.value);
  @override
  List<Object> get props => [value];
}
