import 'package:flutter/material.dart';

import '../tokens/mahafez_responsive.dart';
import '../tokens/mahafez_spacing.dart';

class MahafezInfoCard extends StatelessWidget {
  final String? text;
  final bool isDanger;
  final Widget? child;

  const MahafezInfoCard({
    super.key,
    this.text,
    this.isDanger = false,
    this.child,
  }) : assert(text != null || child != null, 'Either text or child must be provided');

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: MahafezResponsive.allPadding(MahafezSpacing.lg),
      decoration: BoxDecoration(
        color: isDanger
            ? theme.colorScheme.errorContainer.withAlpha(80)
            : theme.colorScheme.primary.withAlpha(20),
        borderRadius: BorderRadius.circular(20.responsiveRadius),
        border: BorderDirectional(
          start: BorderSide(
            color: isDanger
                ? theme.colorScheme.error
                : theme.colorScheme.primary,
            width: 5.responsiveWidth,
          ),
        ),
      ),
      child: child ??
          Text(
            text!,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
    );
  }
}
