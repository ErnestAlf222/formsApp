import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final IconData icon;
  final String? label;
  final String? hint;
  final String? errorMessage;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool? obscureText; 

  const CustomTextFormField({
    super.key,
    required this.icon,
    this.label,
    this.hint,
    this.errorMessage,
    this.onChanged,
    this.validator, 
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
    );
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      //? obscureText => oculta la contraseña
      obscureText: obscureText!,

      decoration: InputDecoration(
          enabledBorder: border,
          focusedBorder:
              border.copyWith(borderSide: BorderSide(color: colors.primary)),
          errorBorder: border.copyWith(
              borderSide: BorderSide(color: Colors.red.shade800)),
          focusedErrorBorder: border.copyWith(
              borderSide: BorderSide(color: Colors.red.shade800)),
          
          isDense: true,
          
          label: label != null ? Text(label!) : null,
          hintText: hint,
          focusColor: colors.primary,
          suffixIcon: Icon(icon, color: colors.primary, size: 25),
          errorText: errorMessage,
          
          ),
    );
  }
}
