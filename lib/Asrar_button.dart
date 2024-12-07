import 'package:flutter/material.dart';
import 'colors.dart'; 

class AsrarButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){}, 
      style: ElevatedButton.styleFrom(
        backgroundColor: colors.lightpink, 
        foregroundColor: colors.white,
        
      ),
      child: Text('Submit'),
    
    );  }
}
