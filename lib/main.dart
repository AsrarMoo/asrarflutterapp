import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/theme_controller.dart';
import 'pages/asrar_homepage.dart';
import 'utils/translations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final controller = Get.put(ThemeController());
  await controller.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<ThemeController>(
      builder: (controller) => GetMaterialApp(
        translations: Messages(),
        locale: const Locale('en'),
        fallbackLocale: const Locale('en'),
        debugShowCheckedModeBanner: false,
        theme: controller.lightTheme,
        darkTheme: controller.darkTheme,
        themeMode:
            controller.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
        home: const AsrarHomePage(),
      ),
    );
  }
}
