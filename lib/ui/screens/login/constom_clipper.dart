
import 'package:flutter/material.dart';

class PasswordClipper extends CustomClipper<Path> {
  final bool isObscure;
  PasswordClipper({required this.isObscure});

  @override
  Path getClip(Size size) {
    Path path = Path();
    if (isObscure) {

      path.addRRect(RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height), const Radius.circular(20)));
    } else {

      path.moveTo(0, 0);
      path.lineTo(size.width - 40, 0);
      path.lineTo(size.width, size.height / 2);
      path.lineTo(size.width - 40, size.height);
      path.lineTo(0, size.height);
      path.close();
    }
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}