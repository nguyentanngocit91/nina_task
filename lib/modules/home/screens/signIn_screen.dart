import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nina_task/modules/home/bloc/auth_bloc/auth_bloc.dart';
import 'package:nina_task/modules/home/screens/home_screen.dart';
class SignIn extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:SafeArea(
        child: Column(
          children: [
            ElevatedButton(onPressed: () {
              context.read<AuthBloc>().add(GoogleSignInRequested());
            },

                child: Text("Login Google"))
          ],
        ),

      )
    );
  }
}
