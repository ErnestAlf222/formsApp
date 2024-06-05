import 'package:flutter/material.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Nuevo usuario'),
      ),
      body: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        // Adapta el notch
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(
                child: Image.network(
                  'https://www.edigitalagency.com.au/wp-content/uploads/lego-logo-png-transparent-background.png',
                  height: 210,
                ),
              ),
              const _RegisterForm(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        // 1. TextFormfield
        const CustomTextFormField(),
        const SizedBox(height: 10),
        const CustomTextFormField(),
        const SizedBox(height: 10),
        const CustomTextFormField(),

        const SizedBox(height: 20),
        FilledButton.tonalIcon(
          onPressed: () {},
          icon: const Icon(Icons.save),
          label: const Text('Guardar'),
        ),
      ],
    ));
  }
}
