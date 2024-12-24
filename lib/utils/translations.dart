import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'asrar_app': 'Asrar App',
          'name': 'Name',
          'email': 'Email',
          'password': 'Password',
          'phone_number': 'Phone Number',
          'agree_terms': 'I agree to the terms and conditions',
          'submit': 'Submit',
          'form_success': 'Form submitted successfully!',
        },
        'ar': {
          'asrar_app': 'تطبيق أسرار',
          'name': 'الاسم',
          'email': 'البريد الإلكتروني',
          'password': 'كلمة المرور',
          'phone_number': 'رقم الهاتف',
          'agree_terms': 'أوافق على الشروط والأحكام',
          'submit': 'إرسال',
          'form_success': 'تم إرسال النموذج بنجاح!',
        },
      };
}
