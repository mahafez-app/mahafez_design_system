import 'package:flutter/material.dart';

import '../tokens/mahafez_responsive.dart';
import '../tokens/mahafez_spacing.dart';

class MahafezInfoCard extends StatelessWidget {
  const MahafezInfoCard({
    super.key,
    required this.child,
    this.padding,
    this.backgroundColor,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: .infinity,
      padding:
          padding ??
          MahafezResponsive.symmetricPadding(
            horizontal: MahafezSpacing.lg,
            vertical: MahafezSpacing.md,
          ),
      decoration: BoxDecoration(
        color: backgroundColor ?? theme.cardTheme.color,
        borderRadius: .circular(16.responsiveRadius),
        border: .all(
          color: theme.colorScheme.outlineVariant.withAlpha(40),
          width: 1,
        ),
      ),
      child: child,
    );
  }
}
