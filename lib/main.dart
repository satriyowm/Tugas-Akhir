// main.dart

import 'package:flutter/material.dart';
import 'pages/login.dart';
import 'pages/register.dart';
import 'pages/activity_input.dart';
import 'pages/child_input.dart';
import 'pages/child_activities.dart';
import 'pages/login_selection.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Day Care App',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginSelectionPage(),
        '/register': (context) => const RegisterPage(),
        '/login': (context) => LoginPage(),
        '/home_caregiver': (context) => const ActivityInputPage(),
        '/home_parent': (context) => const ChildInputPage(),
        '/child_activities': (context) => const ChildActivitiesPage(
              childName: '',
              childAge: 0,
            ),
      },
    );
  }
}
