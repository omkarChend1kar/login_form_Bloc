import 'package:flutter/material.dart';
import 'package:login_form_bloc/src/blocs/provider.dart';
import 'package:login_form_bloc/src/screens/login_screen.dart';

class App extends StatelessWidget {
  const App({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      child: const MaterialApp(
        title:'Log me in',
        home:Scaffold(
          body:LoginScreen(),
        )
      ),
    );
  }
}