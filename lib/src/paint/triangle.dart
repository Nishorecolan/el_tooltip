import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// Design of the triangle that appears attached to the tooltip
class Triangle extends CustomPainter {
  /// [color] of the arrow.
  final Color color;

  Triangle({this.color = const Color(0xff000000)});

  @override
  void paint(Canvas canvas, Size size) {
    // Paint paint = Paint();
    // paint.isAntiAlias = true;
    // paint.color = color;
    // Path path = Path();
    //
    // path.lineTo(size.width * 0.66, size.height * 0.86);
    // path.cubicTo(size.width * 0.58, size.height * 1.05, size.width * 0.42,
    //     size.height * 1.05, size.width * 0.34, size.height * 0.86);
    // path.cubicTo(size.width * 0.34, size.height * 0.86, 0, 0, 0, 0);
    // path.cubicTo(0, 0, size.width, 0, size.width, 0);
    // path.cubicTo(size.width, 0, size.width * 0.66, size.height * 0.86,
    //     size.width * 0.66, size.height * 0.86);
    // path.cubicTo(size.width * 0.66, size.height * 0.86, size.width * 0.66,
    //     size.height * 0.86, size.width * 0.66, size.height * 0.86);
    // canvas.drawPath(path, paint);
    Paint paint = Paint();
    paint.isAntiAlias = true;
    paint.color = color;

    Path path = Path();
    path.lineTo(size.width * 0.66, size.height * 0.86);
    path.cubicTo(size.width * 0.58, size.height * 1.05, size.width * 0.42,
        size.height * 1.05, size.width * 0.34, size.height * 0.86);
    path.cubicTo(size.width * 0.34, size.height * 0.86, 0, 0, 0, 0);
    path.cubicTo(0, 0, size.width, 0, size.width, 0);
    path.cubicTo(size.width, 0, size.width * 0.66, size.height * 0.86,
        size.width * 0.66, size.height * 0.86);
    path.cubicTo(size.width * 0.66, size.height * 0.86, size.width * 0.66,
        size.height * 0.86, size.width * 0.66, size.height * 0.86);

    // // Create a shadow path by offsetting the original path slightly
    Path shadowPath = path.shift(Offset(0.0, 3.5));

    // // Draw the shadow path
    // paint.color = Colors.grey.withOpacity(0.4); // Shadow color with opacity
    paint.color = Colors.grey.shade400; // Shadow color with opacity
    canvas.drawPath(shadowPath, paint);

    // Add a shadow effect using the drawShadow method
    canvas.drawShadow(
      path,
      Colors.grey, // Shadow color
      1.0, // Blur radius
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
