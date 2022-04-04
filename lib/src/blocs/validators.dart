import 'dart:async';

class Validators {
  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains('@') || email == null) {
      sink.add(email);
    } else {
      sink.addError('Enter a valid email address.');
    }
  });
  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      RegExp regex = RegExp(
          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
      if (regex.hasMatch(password) && password.length > 6 || password == null) {
        sink.add(password);
      } else {
        sink.addError('Enter a valid password.');
      }
    },
  );
}
