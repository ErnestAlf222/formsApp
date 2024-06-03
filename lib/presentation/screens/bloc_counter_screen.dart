import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return BlocProvider(
      create: (context) => CounterBloc(),
      child: BlocCounterView(textStyles: textStyles),
    );
  }
}

class BlocCounterView extends StatelessWidget {
  const BlocCounterView({
    super.key,
    required this.textStyles,
  });

  void increasedCounterBy(BuildContext context, [int value = 1]) {
    context.read<CounterBloc>().add(CounterIncreased(value: value));
  }

  final TextTheme textStyles;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: context.select(
          (CounterBloc counter) => Center(
            child: Text('Bloc Counter: ${counter.state.transactionCount}'),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.refresh_rounded,
            ),
            onPressed: () => context.read<CounterBloc>().add(CounterReset()),
          ),
        ],
      ),
      body: context.select(
        (CounterBloc counterBloc) => Center(
          child: Text('Counter value: ${counterBloc.state.counter}'),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: '1',
              onPressed: () => increasedCounterBy(context, 3),
              child: Text('+3', style: textStyles.titleLarge),
            ),
            const SizedBox(height: 15),
            FloatingActionButton(
              heroTag: '2',
              onPressed: () => increasedCounterBy(context, 2),
              child: Text('+2', style: textStyles.titleLarge),
            ),
            const SizedBox(height: 15),
            FloatingActionButton(
              heroTag: '3',
              onPressed: () => increasedCounterBy(context, 1),
              child: Text('+1', style: textStyles.titleLarge),
            ),
          ],
        ),
      ),
    );
  }
}
