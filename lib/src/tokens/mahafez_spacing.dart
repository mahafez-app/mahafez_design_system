import 'package:flutter/material.dart';

import 'mahafez_responsive.dart';

/// Standard 4pt/8pt grid spacing tokens for Mahafez Design System.
abstract final class MahafezSpacing {
  static const double xxs = 2.0;
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 24.0;
  static const double xxl = 32.0;
  static const double xxxl = 48.0;

  /// Default screen edge padding
  static EdgeInsets get pagePadding =>
      MahafezResponsive.symmetricPadding(horizontal: lg, vertical: lg);
}

