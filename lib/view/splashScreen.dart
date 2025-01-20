
import 'package:bloc_app/controller/bloc/Splash_block/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/bloc/Splash_block/splash_event.dart';
import '../controller/bloc/Splash_block/splash_state.dart';



class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc()..add(CheckAuthentication()),
      child: Scaffold(
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is Authenticated) {
              Navigator.pushReplacementNamed(context, '/home');
            } else if (state is Unauthenticated) {
              Navigator.pushReplacementNamed(context, '/login');
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: 200,
                  child: Image.asset('asset/images/food-delivery.png')), 
              ),
              Text('FoodApp',
              style: TextStyle(
                fontSize: 50,
                fontStyle:FontStyle.italic,
                fontWeight:FontWeight.bold,
                color: Colors.orangeAccent ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
