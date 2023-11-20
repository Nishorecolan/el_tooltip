import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// Design of the corner triangle that appears attached to the tooltip
class Corner extends CustomPainter {
  /// [color] of the arrow.
  final Color color;

  Corner({this.color = const Color(0xff000000)});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();
    paint.color = color;
    path = Path();
    path.lineTo(0, size.height * 0.69);
    path.cubicTo(0, size.height * 0.95, size.width * 0.18, size.height * 1.09,
        size.width * 0.31, size.height * 0.93);
    path.cubicTo(
        size.width * 0.31, size.height * 0.93, size.width, 0, size.width, 0);
    path.cubicTo(size.width, 0, 0, 0, 0, 0);
    path.cubicTo(0, 0, 0, size.height * 0.69, 0, size.height * 0.69);
    path.cubicTo(
        0, size.height * 0.69, 0, size.height * 0.69, 0, size.height * 0.69);

    // // Create a shadow path by offsetting the original path slightly
    // Path shadowPath = path.shift(Offset(0, 3.5));
    Path shadowPath = path.shift(Offset(-0.5, 2));

    // // Draw the shadow path
    // paint.color = Colors.grey.withOpacity(0.4); // Shadow color with opacity
    paint.color = Colors.grey.shade400; // Shadow color with opacity
    canvas.drawPath(shadowPath, paint);

    // Add a shadow effect using the drawShadow method
    canvas.drawShadow(
      path,
      Colors.transparent, // Shadow color
      0.0, // Blur radius
      true, // Should include shape in shadow
    );

    // Draw the original triangular shape
    paint.color = color;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
