
import 'package:flutter/material.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final textStyles = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('CubitCounterScreen'),
        actions: [

          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.refresh_rounded,
            ),
          ),
        ],
      ),

      body: const Center(
        child: Text('Counter value: xxxx'),
      ),

      
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
        
            FloatingActionButton(
              heroTag: '1',
              onPressed: () {},
              child:  Text('+3', style: textStyles.titleLarge),
            ),
            const SizedBox(height: 15),
            FloatingActionButton(
              heroTag: '2',
              onPressed: () {},
              child:  Text('+2', style: textStyles.titleLarge),
            ),
            const SizedBox(height: 15),
            FloatingActionButton(
              heroTag: '3',
              onPressed: () {},
              child:  Text('+1', style: textStyles.titleLarge),
            ),
        
          ],
        ),
      ),
    );
  }
}
