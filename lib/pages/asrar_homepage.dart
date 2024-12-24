import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/asrar_colors.dart';
import '../widgets/asrar_text_field.dart';
import '../painters/asrar_painter.dart';
import '../widgets/asrar_button.dart';
import '../utils/validators.dart';
import '../controllers/theme_controller.dart';

class AsrarHomePage extends StatefulWidget {
  const AsrarHomePage({super.key});

  @override
  State<AsrarHomePage> createState() => _AsrarHomePageState();
}

class _AsrarHomePageState extends State<AsrarHomePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  bool _agreeToTerms = false;

  // الوصول إلى متحكم الثيم
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetX<ThemeController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(
            'asrar_app'.tr,
            style: TextStyle(
              color:
                  controller.isDarkMode.value ? Colors.white : Colors.black87,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                controller.isDarkMode.value
                    ? Icons.dark_mode
                    : Icons.light_mode,
                color: controller.isDarkMode.value
                    ? Colors.white
                    : AsrarColors.darkPink,
              ),
              onPressed: controller.toggleTheme,
            ),
            IconButton(
              icon: Icon(
                Icons.language,
                color: controller.isDarkMode.value
                    ? Colors.white
                    : AsrarColors.darkPink,
              ),
              onPressed: () {
                var locale = Get.locale?.languageCode == 'en'
                    ? const Locale('ar')
                    : const Locale('en');
                Get.updateLocale(locale);
              },
            ),
          ],
          backgroundColor:
              controller.isDarkMode.value ? const Color.fromARGB(255, 0, 0, 0) : Colors.white,
        ),
        backgroundColor:
            controller.isDarkMode.value ? Colors.grey[850] : Colors.grey[100],
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: CustomPaint(
                painter: AsrarCurvePainter(),
                child: Container(
                  width: MediaQuery.of(context).size.width > 600
                      ? 600
                      : double.infinity,
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Asrar',
                        style: TextStyle(
                          color: controller.isDarkMode.value
                              ? Colors.white
                              : Colors.pink,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            AsrarTextField(
                              label: 'name'.tr,
                              icon: Icons.person,
                              controller: _nameController,
                              validator: Validators.validateName,
                              keyboardType: TextInputType.name,
                            ),
                            const SizedBox(height: 20),
                            AsrarTextField(
                              label: 'email'.tr,
                              icon: Icons.email,
                              controller: _emailController,
                              validator: Validators.validateEmail,
                              keyboardType: TextInputType.emailAddress,
                            ),
                            const SizedBox(height: 20),
                            AsrarTextField(
                              label: 'password'.tr,
                              icon: Icons.lock,
                              isPassword: true,
                              controller: _passwordController,
                              validator: Validators.validatePassword,
                            ),
                            const SizedBox(height: 20),
                            AsrarTextField(
                              label: 'phone_number'.tr,
                              icon: Icons.phone,
                              controller: _phoneController,
                              validator: Validators.validatePhone,
                              keyboardType: TextInputType.phone,
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Checkbox(
                                  value: _agreeToTerms,
                                  onChanged: (value) {
                                    setState(() {
                                      _agreeToTerms = value ?? false;
                                    });
                                  },
                                  activeColor: AsrarColors.darkPink,
                                ),
                                Text(
                                  'agree_terms'.tr,
                                  style: TextStyle(
                                    color: controller.isDarkMode.value
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            AsrarButton(
                              text: 'submit'.tr,
                              isEnabled: _agreeToTerms,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('form_success'.tr),
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
