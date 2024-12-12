import 'package:flutter/material.dart';
import 'asrar_homepage.dart';

void main() {
  runApp(AsrarApp());
}

class AsrarApp extends StatelessWidget {
  const AsrarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Asrar Project',
      theme: ThemeData(
        primaryColor: const Color(0xFF80D8FF),
      ),
      home: const AsrarHomePage(),
    );
  }
}
