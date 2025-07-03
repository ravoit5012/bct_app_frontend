import 'package:bct/pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'pages/login.dart';

void main() {
  runApp(const BloodConnectApp());
}

class BloodConnectApp extends StatelessWidget {
  const BloodConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BloodConnect',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(primarySwatch: Colors.red, fontFamily: 'Roboto'),

      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),

        '/dashboard': (context) => DashBoard(),

        '/signup':
            (context) =>
                Scaffold(body: Center(child: Text("Sign Up Placeholder"))),
      },
    );
  }
}
