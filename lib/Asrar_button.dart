import 'package:flutter/material.dart';
import 'colors.dart'; 

class AsrarButton extends StatelessWidget {
  const AsrarButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){}, 
      style: ElevatedButton.styleFrom(
        backgroundColor: colors.lightpink, 
        foregroundColor: colors.white,
        
      ),
      child: const Text('Submit'),
    
    );  }
}
