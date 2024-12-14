import 'package:flutter/material.dart';
import '../theme/asrar_colors.dart';

class AsrarCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    var mainPath = Path();
    mainPath.moveTo(size.width * 0.08, size.height * 0.08);
    
    mainPath.quadraticBezierTo(
      size.width * 0.2, 
      size.height * 0.02,
      size.width * 0.35, 
      size.height * 0.08,
    );
    
    mainPath.quadraticBezierTo(
      size.width * 0.5, 
      size.height * 0.14,
      size.width * 0.65, 
      size.height * 0.08,
    );
    
    mainPath.quadraticBezierTo(
      size.width * 0.8, 
      size.height * 0.02,
      size.width * 0.92, 
      size.height * 0.08,
    );
    
    mainPath.quadraticBezierTo(
      size.width, 
      size.height * 0.15,
      size.width, 
      size.height * 0.3,
    );
    
    mainPath.quadraticBezierTo(
      size.width * 1.05, 
      size.height * 0.45,
      size.width, 
      size.height * 0.6,
    );
    
    mainPath.quadraticBezierTo(
      size.width * 0.95, 
      size.height * 0.75,
      size.width, 
      size.height * 0.85,
    );

    mainPath.quadraticBezierTo(
      size.width, 
      size.height * 0.95,
      size.width * 0.92, 
      size.height * 0.92,
    );
    
    mainPath.quadraticBezierTo(
      size.width * 0.8, 
      size.height * 0.98,
      size.width * 0.65, 
      size.height * 0.92,
    );
    
    mainPath.quadraticBezierTo(
      size.width * 0.5, 
      size.height * 0.86,
      size.width * 0.35, 
      size.height * 0.92,
    );
    
    mainPath.quadraticBezierTo(
      size.width * 0.2, 
      size.height * 0.98,
      size.width * 0.08, 
      size.height * 0.92,
    );
    
    mainPath.quadraticBezierTo(
      0, 
      size.height * 0.9,
      0, 
      size.height * 0.7,
    );
    
    mainPath.quadraticBezierTo(
      size.width * -0.05, 
      size.height * 0.5,
      0, 
      size.height * 0.3,
    );
    
    mainPath.quadraticBezierTo(
      0, 
      size.height * 0.15,
      size.width * 0.08, 
      size.height * 0.08,
    );

    canvas.drawShadow(mainPath, Colors.grey, 15, true);
    canvas.drawPath(mainPath, paint);

    final wavePaint = Paint()
      ..color = AsrarColors.darkPink.withOpacity(0.05)
      ..style = PaintingStyle.fill;

    var wavePath = Path();
    wavePath.moveTo(0, size.height * 0.35);
    
    wavePath.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.25,
      size.width * 0.5,
      size.height * 0.35,
    );
    
    wavePath.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.45,
      size.width,
      size.height * 0.35,
    );
    
    wavePath.lineTo(size.width, size.height * 0.45);
    
    wavePath.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.55,
      size.width * 0.5,
      size.height * 0.45,
    );
    
    wavePath.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.35,
      0,
      size.height * 0.45,
    );
    
    wavePath.close();
    canvas.drawPath(wavePath, wavePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}