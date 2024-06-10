import 'package:formz/formz.dart';

enum UsernameError { empty, length }

class Username extends FormzInput<String, UsernameError> {

  // pure => valor inicial
  const Username.pure() : super.pure('');

  // dirty => campo alterado por usuario
  const Username.dirty(super.value) : super.dirty();

  @override
  UsernameError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return UsernameError.empty;
    if (value.length < 6) return UsernameError.length;

    return null;
  }
}
