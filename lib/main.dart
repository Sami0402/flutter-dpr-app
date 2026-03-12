import 'package:dpr_app/screens/login_screen.dart';
import 'package:dpr_app/screens/project_list_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'dpr App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          brightness: Brightness.light,
        ),
      ),
      home: LoginScreen(),
      initialRoute: '/projectList',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/projectList': (context) => const ProjectListScreen(),
      },
    );
  }
}
