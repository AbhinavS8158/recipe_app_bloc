

import 'package:bloc_app/controller/bloc/Splash_block/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'controller/api/loginapi.dart';
import 'controller/bloc/login_block/login_block_bloc.dart';
import 'view/homeScreen.dart';
import 'view/loginScreen.dart';
import 'view/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBlockBloc(authService:AuthService() ),
        ),
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/home': (context) => const HomeScreen(),
          '/login': (context) => LoginScreen(),
        },
      ),
    );
  }
}
