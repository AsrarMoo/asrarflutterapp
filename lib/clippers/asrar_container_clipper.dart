import 'package:flutter/material.dart';

class AsrarContainerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
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

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
