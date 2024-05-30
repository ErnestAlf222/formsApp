import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return BlocProvider(
      create: (_) => CounterCubit(),
      child: _CubitCounterView(textStyles: textStyles),
    );
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView({
    required this.textStyles,
  });

  void increasedCounterBy(BuildContext context, [int value = 1]) {
    context.read<CounterCubit>().increasedBy(value);
  }

  final TextTheme textStyles;

  @override
  Widget build(BuildContext context) {
    // final counterState = context.watch<CounterCubit>().state;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // title: Text('Cubit Counter: ${counterState.transactionCount}'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<CounterCubit>().reset(0);
            },
            icon: const Icon(
              Icons.refresh_rounded,
            ),
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          // buildWhen: (previous, current) => current.counter != previous.counter,

          builder: (context, state) {
            print('counter cambio');
            return Text('Counter value: ${state.counter}');
          },
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: '1',
              child: Text('+1', style: textStyles.titleLarge),
              onPressed: () => increasedCounterBy(context, 1),
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
              onPressed: () => increasedCounterBy(context, 3),
              child: Text('+3', style: textStyles.titleLarge),
            ),
          ],
        ),
      ),
    );
  }
}
