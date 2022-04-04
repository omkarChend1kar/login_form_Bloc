import 'dart:async';

import 'package:login_form_bloc/src/blocs/validators.dart';

class Bloc extends Object with Validators {
  final _emailController = StreamController<String>();
  final _passwordController = StreamController<String>();

  //This lets you add data input to the stream.
  Function(String) get onchangeEmail => _emailController.sink.add;
  Function(String) get onchangePassword => _passwordController.sink.add;

  //This lets you add data from Stream.
  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password =>_passwordController.stream.transform(validatePassword);

  //Everytime we create streamcontroller unless we close it,Its sink stays open
  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}

//Using single Global scope.
final bloc = Bloc();
