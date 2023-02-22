import 'package:flutter/material.dart';

class Palette {
  static const Color primary = Color(0xFF000000);
  static const Color secondary = Color(0xFFFFFFFF);

  static const Color secondary_orange = Color(0xFFFE7401);
  static const Color secondary_orange_light = Color(0xFFFFE7D2);
  static const Color secondary_green = Color(0xFF0CBE3C);
  static const Color secondary_red = Color(0xFFFF331F);
  static const Color secondary_yellow = Color(0xFFFCAD24);
  static const Color secondary_yellow_two = Color(0xFFFFE65B);

  static const Color secondary_red_dark = Color(0xFF9B0E00);

  static const Color black = Color(0xFF080808);
  static const Color black2 = Color(0xFF161617);
  static const Color black3 = Color(0xFF1F2022);
  static const Color black4 = Color(0xFF2A2C2E);

  static const Color gray2 = Color(0xFF4F4F4F);
  static const Color gray3 = Color(0xFF828282);
  static const Color gray4 = Color(0xFFBDBDBD);
  static const Color gray5 = Color(0xFFE0E0E0);
  static const Color gray6 = Color(0xFFF2F2F2);
  static const Color gray7 = Color(0xFFF1F1F2);
  static const Color gray8 = Color(0xFFF4F4F4);

  static const Cubic easeCurve = Cubic(0.6, 0.05, -0.01, 0.9);

  static const LinearGradient gradient1 = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [primary, secondary],
  );
}
