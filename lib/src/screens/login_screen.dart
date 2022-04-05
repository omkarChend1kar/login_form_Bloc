import 'package:flutter/material.dart';
import 'package:login_form_bloc/src/blocs/provider.dart';
import '../blocs/bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            emailField(bloc),
            const SizedBox(
              width: 100,
              height: 20,
            ),
            passwordField(bloc),
            const SizedBox(
              width: 100,
              height: 20,
            ),
            submitButton(bloc),
          ],
        ),
      ),
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder(
        //Retrieve the stream
        stream: bloc.email,
        //Everytime stream data changes builder function rebuilds the TextField widget
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.onchangeEmail,
            decoration: InputDecoration(
              //Every object that comes across the stream gets wrapped into snapshot argument
              errorText: snapshot.error?.toString(),
              labelText: 'Email',
              hintText: 'yourId@example.com',
              // fillColor: Color.fromARGB(251, 119, 89, 89),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 255, 0, 0),
                  width: 1,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 255, 0, 0),
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: Color.fromARGB(174, 92, 92, 92),
                  width: 2.5,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: const BorderSide(
                  color: Color.fromARGB(174, 92, 92, 92),
                  width: 2.5,
                ),
              ),
            ),
          );
        });
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
        //Retrieve the stream
        stream: bloc.password,
        //Everytime stream data changes builder function rebuilds the TextField widget
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.onchangePassword,
            decoration: InputDecoration(
              counterText: 'Min 6 characters',
              errorText: snapshot.error?.toString(),
              labelText: 'Password',
              hintText: 'Enter password',
              fillColor: const Color.fromARGB(252, 182, 182, 182),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 255, 0, 0),
                  width: 1,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 255, 0, 0),
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: Color.fromARGB(174, 92, 92, 92),
                  width: 2.5,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: const BorderSide(
                  color: Color.fromARGB(174, 92, 92, 92),
                  width: 2.5,
                ),
              ),
            ),
            obscureText: true,
          );
        });
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder<Object>(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return ElevatedButton(
          onPressed: snapshot.hasData ? bloc.submit : null,
          child: const Text('Login'),
        );
      },
    );
  }
}
