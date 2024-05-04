import 'package:amuts_project/ui/login.dart';
import 'package:amuts_project/ui/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Amuts",
      home: const SplashScreen(),
      initialRoute: '/',
      routes: {
        '/login' :  (context) => const LoginScreen()
      },
    );
  }
}

