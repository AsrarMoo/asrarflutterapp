import 'package:flutter/material.dart';
import '../theme/asrar_colors.dart';
import 'package:get/get.dart';
import '../controllers/theme_controller.dart';

class AsrarButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isEnabled;

  const AsrarButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return GetX<ThemeController>(
      builder: (themeController) => ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
            backgroundColor: themeController.isDarkMode.value
                ? Colors.white
                : AsrarColors.darkPink,
            foregroundColor: themeController.isDarkMode.value
                ? AsrarColors.darkPink
                : Colors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 15,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            disabledBackgroundColor: themeController.isDarkMode.value
                ? const Color.fromARGB(255, 178, 147, 163)
                : AsrarColors.darkPink),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
