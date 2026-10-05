import 'package:flutter/material.dart';

import '../tokens/mahafez_responsive.dart';

class MahafezSkeletonBox extends StatelessWidget {
  const MahafezSkeletonBox({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = 8,
    this.color,
  });

  const MahafezSkeletonBox.circular({
    super.key,
    required double size,
    this.color,
  }) : width = size,
       height = size,
       borderRadius = size / 2;

  final double width;
  final double height;
  final double borderRadius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final resolvedColor =
        color ??
        (isDark
            ? Colors.white.withAlpha(20)
            : theme.colorScheme.onSurface.withAlpha(15));

    return Container(
      width: width.responsiveWidth,
      height: height.responsiveHeight,
      decoration: BoxDecoration(
        color: resolvedColor,
        borderRadius: .circular(borderRadius.responsiveRadius),
      ),
    );
  }
}
