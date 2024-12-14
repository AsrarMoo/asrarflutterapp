import 'package:flutter/material.dart';
import '../theme/asrar_colors.dart';
import '../widgets/asrar_text_field.dart';
import '../painters/asrar_painter.dart';
import '../widgets/asrar_button.dart';
import '../utils/validators.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
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
                padding: EdgeInsets.all(30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Asrar',
                      style: TextStyle(
                        color: AsrarColors.darkPink,
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
                            label: 'Name',
                            icon: Icons.person,
                            controller: _nameController,
                            validator: Validators.validateName,
                            keyboardType: TextInputType.name,
                          ),
                          const SizedBox(height: 20),
                          AsrarTextField(
                            label: 'Email',
                            icon: Icons.email,
                            controller: _emailController,
                            validator: Validators.validateEmail,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 20),
                          AsrarTextField(
                            label: 'Password',
                            icon: Icons.lock,
                            isPassword: true,
                            controller: _passwordController,
                            validator: Validators.validatePassword,
                          ),
                          const SizedBox(height: 20),
                          AsrarTextField(
                            label: 'Phone Number',
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
                              const Text('I agree to terms and conditions'),
                            ],
                          ),
                          const SizedBox(height: 30),
                          AsrarButton(
                            text: 'Submit',
                            isEnabled: _agreeToTerms,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Form submitted successfully!'),
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
    );
  }
} 