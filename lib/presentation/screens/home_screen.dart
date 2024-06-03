import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: const Text('Cubits'),
            subtitle: const Text('Gestor de estado simple cubit'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 30),
            
            onTap: () => context.push('/cubit'),
          ),
          ListTile(
            title: const Text('Bloc'),
            subtitle: const Text('Gestor de estado simple bloc'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 30),
            
            onTap: () => context.push('/bloc'),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(),
          ),
          ListTile(
            title: const Text('Nuevo usuario'),
            subtitle: const Text('Manejo de formularios'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 30),
            
            onTap: () => context.push('/register'),
          ),
        ],
      ),
    );
  }
}
