
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_caller_theme_01/models/particle.dart';
import 'package:flutter_caller_theme_01/widgets/fluid_painter.dart';

class FluidSimulationAnimation extends StatefulWidget {
  const FluidSimulationAnimation({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FluidSimulationAnimationState createState() => _FluidSimulationAnimationState();
}

class _FluidSimulationAnimationState extends State<FluidSimulationAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late List<Particle> particles;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..addListener(() {
        updateParticles();
      })..repeat();

    particles = List.generate(
      100,
      (index) => Particle(
        Random().nextDouble() * 200,
        Random().nextDouble() * 200,
        (Random().nextDouble() - 0.5) * 5,
        (Random().nextDouble() - 0.5) * 5,
      ),
    );
  }

  void updateParticles() {
    for (var particle in particles) {
      particle.x += particle.velocityX;
      particle.y += particle.velocityY;

      // Bounce off walls
      if (particle.x < 0 || particle.x > 200) {
        particle.velocityX = -particle.velocityX;
      }
      if (particle.y < 0 || particle.y > 200) {
        particle.velocityY = -particle.velocityY;
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return CustomPaint(
              painter: FluidPainter(particles),
              size: const Size(200, 200),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
