
import 'package:flutter/material.dart';
import 'package:flutter_caller_theme_01/models/particle.dart';

class FluidPainter extends CustomPainter {
  final List<Particle> particles;

  FluidPainter(this.particles);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    for (var particle in particles) {
      canvas.drawCircle(Offset(particle.x, particle.y), 5, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}