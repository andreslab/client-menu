import 'package:flutter/material.dart';

class ColorsApp {
  static const colorP = const Color(0xFFFD7E77);
  static const colorS = const Color(0xFFF59E27);
  static const colorT = const Color(0xFF1C2026);
  static const colorF = const Color(0xFF515C6F);

  static LinearGradient gradientColorPrimary() {
    return LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [colorP, colorS]);
  }

  static List<BoxShadow> shadowList = [
    BoxShadow(color: Colors.grey[300], blurRadius: 30, offset: Offset(0, 10))
  ];
}
