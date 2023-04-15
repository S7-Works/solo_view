

import 'package:flutter/material.dart';

class SoloViewHolePainter extends CustomPainter {
  const SoloViewHolePainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = color;
  }

  @override
  bool shouldRepaint(SoloViewHolePainter oldDelegate) {
    return color != oldDelegate.color;
  }
}
