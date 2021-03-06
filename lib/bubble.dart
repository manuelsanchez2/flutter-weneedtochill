import 'package:flutter/material.dart';

class BubbleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 100);
    path.quadraticBezierTo(size.width, size.height - 50, size.width + 200, 0);
    path.lineTo(size.width, 0);
    path.quadraticBezierTo(size.width + 300, 400, size.width - 300, -100);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
