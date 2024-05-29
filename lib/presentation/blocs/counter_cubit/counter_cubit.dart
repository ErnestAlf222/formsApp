import 'package:flutter_bloc/flutter_bloc.dart';
part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counter: 5));

  void increasedBy(int value) {
    emit(state.copyWith(
      counter: state.counter + value,
      transactionCount: state.counter + 1,
    ));
  }

  void reset(int value) {
    emit(state.copyWith(
      counter: 0,
    ));
    
  }
}
