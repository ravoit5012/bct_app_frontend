import 'package:flutter/material.dart';
import 'login.dart'; // Import the login page

void main() {
  runApp(const BloodConnectApp());
}

class BloodConnectApp extends StatelessWidget {
  const BloodConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blood Connect',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        // '/': (context) => const LoginScreen(),
        '/': (context) => const LoginScreen(),
        '/dashboard': (context) => Scaffold(body: Center(child: Text("Dashboard Placeholder"))), // temporary
        '/signup': (context) => Scaffold(body: Center(child: Text("Sign Up Placeholder"))), // temporary
        // Add more routes like '/signup': (_) => const SignUpScreen(), etc.
      },
    );
  }
}
