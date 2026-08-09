import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'forgot_password.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login App',
      home: const LoginScreen(),

    );
  }
}