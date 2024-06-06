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

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  // Creación de clave global
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String username = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            // 1. TextFormfield
            CustomTextFormField(
              icon: Icons.unsubscribe_rounded,
              label: 'Nombre de usuario',
              onChanged: (value) => username = value,
              validator: (value) {
                if (value == null || value.isEmpty) return 'Campo requerido';
                if (value.trim().isEmpty) return 'Campo requerido';
                if (value.length < 6) return 'Más de 6 letras';
                return null;
              },
            ),
            const SizedBox(height: 30),

            CustomTextFormField(
              icon: Icons.alternate_email_outlined,
              label: 'Correo',
              onChanged: (value) => email = value,
              validator: (value) {
                if (value == null || value.isEmpty) return 'Campo requerido';
                if (value.trim().isEmpty) return 'Campo requerido';

                final emailRegExp = RegExp(
                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                );
                if (!emailRegExp.hasMatch(value)) return 'No tiene formato de correo';
                return null;
              },
            ),
            const SizedBox(height: 30),

            CustomTextFormField(
              icon: Icons.password_rounded,
              label: 'Contraseña',
              obscureText: true,
              onChanged: (value) => password = value,
               validator: (value) {
                if (value == null || value.isEmpty) return 'Campo requerido';
                if (value.trim().isEmpty) return 'Campo requerido';
                if (value.length < 6) return 'Más de 6 letras';
                return null;
              },
            ),
            const SizedBox(height: 45),

            FilledButton.tonalIcon(
              icon: const Icon(Icons.save),
              label: const Text('Guardar'),
              onPressed: () {
                // currentState => valor actual
                final isValid = _formKey.currentState!.validate();
                if (!isValid) return;
                // print('$username, $email, $password');
              },
            ),
          ],
        ));
  }
}
