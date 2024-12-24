import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/theme_controller.dart';
import '../theme/asrar_colors.dart';

class AsrarCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final themeController = Get.find<ThemeController>();
    final paint = Paint()
      ..color =
          themeController.isDarkMode.value ? const Color.fromARGB(255, 63, 63, 63)! : Colors.white
      ..style = PaintingStyle.fill;

    var path = Path();

    // نقطة البداية
    path.moveTo(0, size.height * 0.1);

    // المنحنى العلوي الأيسر
    path.quadraticBezierTo(
      size.width * 0.1,
      0,
      size.width * 0.5,
      0,
    );

    // المنحنى العلوي الأيمن
    path.quadraticBezierTo(
      size.width * 0.9,
      0,
      size.width,
      size.height * 0.1,
    );

    // الخط الأيمن
    path.lineTo(size.width, size.height * 0.9);

    // المنحنى السفلي الأيمن
    path.quadraticBezierTo(
      size.width * 0.9,
      size.height,
      size.width * 0.5,
      size.height,
    );

    // المنحنى السفلي الأيسر
    path.quadraticBezierTo(
      size.width * 0.1,
      size.height,
      0,
      size.height * 0.9,
    );

    // إغلاق المسار
    path.close();

    // إضافة الظل
    canvas.drawShadow(
      path,
      Colors.grey.withOpacity(0.3),
      10,
      true,
    );

    // رسم الشكل الرئيسي
    canvas.drawPath(path, paint);

    // إضافة التموج الخفيف
    final wavePaint = Paint()
      ..color = (themeController.isDarkMode.value
              ? Colors.white
              : AsrarColors.darkPink)
          .withOpacity(0.05)
      ..style = PaintingStyle.fill;

    var wavePath = Path();
    wavePath.moveTo(0, size.height * 0.5);
    wavePath.quadraticBezierTo(
      size.width * 0.5,
      size.height * 0.4,
      size.width,
      size.height * 0.5,
    );
    wavePath.lineTo(size.width, size.height * 0.6);
    wavePath.quadraticBezierTo(
      size.width * 0.5,
      size.height * 0.7,
      0,
      size.height * 0.6,
    );
    wavePath.close();

    canvas.drawPath(wavePath, wavePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
