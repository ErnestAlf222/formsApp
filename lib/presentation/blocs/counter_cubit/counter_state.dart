part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final int counter;
  final int transactionCount;

  const CounterState({
    this.counter = 0,
    this.transactionCount = 0,
  });

  // * Emitir nuevo estado
  copyWith({
    int? counter,
    int? transactionCount,
  }) =>
      CounterState(
        counter: counter ?? this.counter,
        transactionCount: transactionCount ?? this.transactionCount,
      );

  // Emite un nuevo estado pero verifica el estado del valor anterior, y no dispara nuevamente
  @override
  List<Object> get props => [counter, transactionCount];
}
