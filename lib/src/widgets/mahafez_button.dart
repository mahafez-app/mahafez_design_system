import 'package:flutter/material.dart';

import '../tokens/mahafez_responsive.dart';
import '../tokens/mahafez_spacing.dart';

enum MahafezButtonType { primary, secondary, tertiary }

class MahafezButton extends StatelessWidget {
  const MahafezButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.type = .primary,
    this.isLoading = false,
    this.icon,
    this.trailingIcon,
    this.foregroundColor,
    this.backgroundColor,
  });

  final String label;
  final VoidCallback? onPressed;
  final MahafezButtonType type;
  final bool isLoading;
  final Widget? icon;
  final Widget? trailingIcon;
  final Color? foregroundColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final resolvedBg =
        backgroundColor ??
        switch (type) {
          .primary => theme.colorScheme.primary,
          .secondary => theme.colorScheme.secondaryContainer,
          .tertiary => Colors.transparent,
        };

    final resolvedFg =
        foregroundColor ??
        switch (type) {
          .primary => theme.colorScheme.onPrimary,
          .secondary => theme.colorScheme.onSecondaryContainer,
          .tertiary => theme.colorScheme.primary,
        };

    final content = Row(
      mainAxisAlignment: .center,
      mainAxisSize: .min,
      children: [
        if (isLoading) ...[
          SizedBox(
            width: 20.responsiveWidth,
            height: 20.responsiveHeight,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation(resolvedFg),
            ),
          ),
          MahafezSpacing.sm.horizontalSpace,
        ] else if (icon != null) ...[
          IconTheme(
            data: IconThemeData(color: resolvedFg, size: 20.responsiveRadius),
            child: icon!,
          ),
          MahafezSpacing.sm.horizontalSpace,
        ],
        Text(
          label,
          style: theme.textTheme.labelLarge?.copyWith(
            color: resolvedFg,
            fontWeight: .w700,
          ),
        ),
        if (trailingIcon != null && !isLoading) ...[
          MahafezSpacing.sm.horizontalSpace,
          IconTheme(
            data: IconThemeData(color: resolvedFg, size: 20.responsiveRadius),
            child: trailingIcon!,
          ),
        ],
      ],
    );

    return SizedBox(
      width: double.infinity,
      height: 56.responsiveHeight,
      child: FilledButton(
        onPressed: isLoading ? null : onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: resolvedBg,
          foregroundColor: resolvedFg,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.responsiveRadius),
            side: type == .tertiary
                ? BorderSide(color: theme.colorScheme.outlineVariant)
                : BorderSide.none,
          ),
        ),
        child: content,
      ),
    );
  }
}
