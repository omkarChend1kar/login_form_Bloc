import 'package:flutter/material.dart';
import 'dart:async';
import 'package:login_form_bloc/src/blocs/bloc.dart';

class Provider extends InheritedWidget {
  final bloc = Bloc();

  bool updateShouldNotify(_) => true;

  Provider({Key? key, Widget? child}) : super(key: key, child: child!);

  static Bloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<Provider>() as Provider).bloc;
  }
}
