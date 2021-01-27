part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {}

class Increment extends CounterEvent {
  @override
  List<Object> get props => [];
}
