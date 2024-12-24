import 'package:flutter/material.dart';
import '../theme/asrar_colors.dart';
import 'package:get/get.dart';
import '../controllers/theme_controller.dart';

class AsrarTextField extends StatelessWidget {
  final String label;
  final IconData icon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool isPassword;

  const AsrarTextField({
    super.key,
    required this.label,
    required this.icon,
    required this.controller,
    this.validator,
    this.keyboardType,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return GetX<ThemeController>(
      builder: (themeController) => TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(
            icon,
            color: themeController.isDarkMode.value
                ? Colors.white70
                : AsrarColors.darkPink,
          ),
          labelStyle: TextStyle(
            color: themeController.isDarkMode.value
                ? Colors.white70
                : Colors.grey[700],
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: themeController.isDarkMode.value
                  ? Colors.white30
                  : Colors.grey[300]!,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: themeController.isDarkMode.value
                  ? Colors.white
                  : AsrarColors.darkPink,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.red),
          ),
        ),
        style: TextStyle(
          color: themeController.isDarkMode.value ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
