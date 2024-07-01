import 'package:flutter/material.dart';

class NumberOneClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0); // Top left corner
    path.lineTo(size.width, size.height); // Bottom right corner
    path.lineTo(0, size.height); // Bottom left corner
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class NumberTwoClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height * 0.5); // Start at the middle of the left side
    path.lineTo(size.width, 0); // Top right corner
    path.lineTo(size.width, size.height); // Bottom right corner
    path.close(); // Connect back to the starting point
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class NumberThreeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height); // Start at the bottom left corner
    path.lineTo(size.width * 0.75,
        0); // Top corner, adjust the width ratio to change the shape
    path.lineTo(size.width, size.height); // Bottom right corner
    path.close(); // Connect back to the starting point
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
