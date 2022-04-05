import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:login_form_bloc/src/blocs/validators.dart';

class Bloc extends Object with Validators {
  //using StreamController.broadcast() since only StreamController has single subscription model which lets us listen to the stream events once
  final _emailController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();

  //This lets you add data input to the stream.
  Function(String) get onchangeEmail => _emailController.sink.add;
  Function(String) get onchangePassword => _passwordController.sink.add;

  //This lets you add data from Stream.
  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);

  //Using Rxdart lib to make the submit button operable only when both email and password are valid
  Stream<bool> get submitValid =>
      CombineLatestStream.combine2(email, password, (e, p) => true);

  //callback for onPressed button
  submit() {
    // print(email);
    // print(password);
  }

  //Everytime we create streamcontroller unless we close it,Its sink stays open
  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}

//Using single Global scope.
//final bloc = Bloc();
