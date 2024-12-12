import 'package:flutter/material.dart';

class ValidationPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  ValidationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Validation Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // حقل الاسم
              TextFormField(
                decoration: const InputDecoration(labelText: 'الاسم'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء إدخال الاسم';
                  }
                  if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                    return 'يجب أن يحتوي الاسم على حروف فقط';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // حقل رقم الهاتف
              TextFormField(
                decoration: const InputDecoration(labelText: 'رقم الهاتف'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء إدخال رقم الهاتف';
                  }
                  if (!RegExp(r'^7[0-9]{8}$').hasMatch(value)) {
                    return 'يجب أن يكون رقم الهاتف مكونًا من 9 أرقام ويبدأ بـ 7';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // حقل البريد الإلكتروني
              TextFormField(
                decoration: const InputDecoration(labelText: 'البريد الإلكتروني'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء إدخال البريد الإلكتروني';
                  }
                  if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(value)) {
                    return 'الرجاء إدخال بريد إلكتروني صالح';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // حقل كلمة المرور
              TextFormField(
                decoration: const InputDecoration(labelText: 'كلمة المرور'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء إدخال كلمة المرور';
                  }
                  if (value.length < 6) {
                    return 'يجب أن تكون كلمة المرور مكونة من 6 أحرف على الأقل';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),

              // زر التحقق
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('التحقق ناجح!')),
                    );
                  }
                },
                child: const Text('تحقق'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
