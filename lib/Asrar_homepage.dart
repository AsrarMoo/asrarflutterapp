import 'package:flutter/material.dart';
import 'asrar_textfield.dart';
import 'asrar_button.dart';
import 'colors.dart'; 

class AsrarHomePage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  AsrarHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.white, 
      appBar: AppBar(
        title: const Text('Asrar Home Page'),
        backgroundColor: const Color.fromARGB(255, 67, 5, 51),
        titleTextStyle: const TextStyle(
          color: colors.white,
        )
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: colors.darkpink,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      AsrarTextFields(),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end, // محاذاة الزر إلى اليمين
                        children: [
                          AsrarButton(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
