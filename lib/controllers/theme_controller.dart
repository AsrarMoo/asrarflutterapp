import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  static const String themeKey = 'theme_mode';
  final _isDarkMode = false.obs;
  late SharedPreferences _prefs;

  RxBool get isDarkMode => _isDarkMode;

  final lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.pink,
    colorScheme: ColorScheme.light(
      primary: Colors.pink,
      secondary: Colors.pinkAccent,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    scaffoldBackgroundColor: Colors.grey[100],
  );

  final darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.pink,
    colorScheme: ColorScheme.dark(
      primary: Colors.pink,
      secondary: Colors.pinkAccent,
      surface: Colors.grey[850]!,
      background: Colors.grey[900]!,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[900],
      elevation: 0,
    ),
    scaffoldBackgroundColor: Colors.grey[900],
  );

  @override
  void onInit() async {
    super.onInit();
    await initTheme();
  }

  Future<ThemeController> init() async {
    await initTheme();
    return this;
  }

  Future<void> initTheme() async {
    _prefs = await SharedPreferences.getInstance();
    final savedTheme = _prefs.getBool(themeKey);
    if (savedTheme != null) {
      _isDarkMode.value = savedTheme;
    } else {
      final brightness = WidgetsBinding.instance.window.platformBrightness;
      _isDarkMode.value = brightness == Brightness.dark;
      await _prefs.setBool(themeKey, _isDarkMode.value);
    }
  }

  void toggleTheme() async {
    _isDarkMode.value = !_isDarkMode.value;
    // تخزين التفضيل الجديد
    await _prefs.setBool(themeKey, _isDarkMode.value);
    Get.changeThemeMode(_isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }
}
