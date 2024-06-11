import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register/register_cubit.dart';
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
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _RegisterView(),
      ),
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
                child: BounceInUp(
                  child: Image.network(
                    'https://1000marcas.net/wp-content/uploads/2020/01/logo-Lego.png',
                    height: 177,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const _RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  // Creación de clave global
  @override
  Widget build(BuildContext context) {
    // watch => redibuja del build
    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.username;
    final email = registerCubit.state.email;
    final password = registerCubit.state.password;

    return Form(
        child: Column(
      children: [
        // 1. TextFormfield
        CustomTextFormField(
          icon: Icons.unsubscribe_rounded,
          label: 'Nombre de usuario',
          onChanged: registerCubit.usernameChanged,
          errorMessage: username.errorMessage,
        ),
        const SizedBox(height: 30),

        CustomTextFormField(
          icon: Icons.alternate_email_outlined,
          label: 'Correo',
         onChanged: registerCubit.emailChanged,
         errorMessage: email.errorMessage,
        ),
        const SizedBox(height: 30),

        CustomTextFormField(
          icon: Icons.password_rounded,
          label: 'Contraseña',
          obscureText: true,
          onChanged: registerCubit.passwordChanged,
          errorMessage: password.errorMessage,
        ),
        const SizedBox(height: 45),

        FilledButton.tonalIcon(
          icon: const Icon(Icons.save),
          label: const Text('Guardar'),
          onPressed: () {
            registerCubit.onSubmit();
          },
        ),
      ],
    ));
  }
}
