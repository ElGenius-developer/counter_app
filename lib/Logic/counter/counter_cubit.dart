import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counter: 0));
  increment()=>emit(CounterState(counter: state.counter+1,isAdd: true));
  decrement()=>emit(CounterState(counter: state.counter-1,isAdd: false));
}
