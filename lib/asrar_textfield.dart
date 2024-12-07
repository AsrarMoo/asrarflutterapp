import 'package:flutter/material.dart';

class AsrarTextFields extends StatelessWidget {
  const AsrarTextFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration:   const InputDecoration(
            labelText: 'Enter your name',
            border: OutlineInputBorder(),
            fillColor: Colors.white, 
            filled: true, 
            prefixIcon: Icon(Icons.person, color: Color.fromARGB(255, 75, 82, 88))
          ),
         
        ),
        const SizedBox(height: 15),
        TextFormField(
          decoration:  const InputDecoration(
            labelText: 'Enter your Email',
            border: OutlineInputBorder(),
            fillColor: Colors.white,
            filled: true,
            prefixIcon: Icon(Icons.email, color: const Color.fromARGB(255, 75, 82, 88))
          ),
         
        ),
        const SizedBox(height: 15),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Enter your password',
            border: OutlineInputBorder(),
            fillColor: Colors.white,
            filled: true,
             prefixIcon: Icon(Icons.lock, color: const Color.fromARGB(255, 75, 82, 88))
          ),
        
        ),
        const SizedBox(height: 15),
        TextFormField(
          decoration:const InputDecoration(
            labelText: 'Enter your phone number',
            border: OutlineInputBorder(),
            fillColor: Colors.white,
            filled: true,
             prefixIcon: Icon(Icons.phone, color: const Color.fromARGB(255, 75, 82, 88))
          ),
        
        ),
      ],
    );
  }
}
