import 'package:flutter/material.dart';
import '../theme/asrar_colors.dart';

class AsrarButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool isEnabled;

  const AsrarButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnabled ? onPressed : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: AsrarColors.darkPink,
        padding: const EdgeInsets.symmetric(
          horizontal: 50,
          vertical: 15,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        disabledBackgroundColor: AsrarColors.grey,
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          color: AsrarColors.white,
        ),
      ),
    );
  }
}