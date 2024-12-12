import 'package:flutter/material.dart';
import 'colors.dart'; 
import 'ValidationPage.dart'; 

class AsrarHomePage extends StatefulWidget {
  const AsrarHomePage({super.key});

  @override
  _AsrarHomePageState createState() => _AsrarHomePageState();
}

class _AsrarHomePageState extends State<AsrarHomePage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? name;
  String? email;
  String? phone;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Asrar Home Page'),
        backgroundColor: const Color.fromARGB(255, 67, 5, 51),
        titleTextStyle: const TextStyle(color: Colors.white),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 152, 119, 144), 
            borderRadius: BorderRadius.circular(15),
          ),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Enter your name',
                    labelStyle: TextStyle(color: Colors.black), 
                    prefixIcon: Icon(Icons.person, color: Colors.black), 
                    filled: true, 
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  validator: (value) => ValidationPage.validateName(value),
                  onChanged: (value) => name = value,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Enter your Email',
                    labelStyle: TextStyle(color: Colors.black), 
                    prefixIcon: Icon(Icons.email, color: Colors.black), 
                    filled: true, 
                    fillColor: Colors.white, 
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black), 
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => ValidationPage.validateEmail(value),
                  onChanged: (value) => email = value,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Enter your phone number',
                    labelStyle: TextStyle(color: Colors.black), 
                    prefixIcon: Icon(Icons.phone, color: Colors.black), 
                    filled: true, 
                    fillColor: Colors.white, 
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black), 
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) => ValidationPage.validatePhone(value),
                  onChanged: (value) => phone = value,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Enter your password',
                    labelStyle: TextStyle(color: Colors.black), 
                    prefixIcon: Icon(Icons.lock, color: Colors.black), 
                    filled: true, 
                    fillColor: Colors.white, 
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black), 
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  obscureText: true,
                  validator: (value) => ValidationPage.validatePassword(value),
                  onChanged: (value) => password = value,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('All inputs are valid!')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colors.darkpink,
                    padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 15),
                  ),
                  child: const Text('Submit', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
