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
    final isDisabled = onPressed == null || isLoading;

    final Color indicatorColor = switch (type) {
      .primary =>
        backgroundColor != null
            ? theme.colorScheme.onSurface
            : theme.colorScheme.onPrimary,
      .secondary ||
      .tertiary => foregroundColor ?? theme.colorScheme.primary,
    };

    final Widget child = isLoading
        ? SizedBox.square(
            dimension: 20.responsiveWidth,
            child: CircularProgressIndicator(
              strokeWidth: 2.5.responsiveWidth,
              valueColor: AlwaysStoppedAnimation<Color>(indicatorColor),
            ),
          )
        : trailingIcon != null
        ? Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(label, textAlign: TextAlign.center),
              MahafezSpacing.sm.horizontalSpace,
              trailingIcon!,
            ],
          )
        : Text(label, textAlign: TextAlign.center);

    final ButtonStyle? customStyle =
        foregroundColor != null || backgroundColor != null
        ? switch (type) {
            .primary => FilledButton.styleFrom(
              foregroundColor: foregroundColor,
              backgroundColor: backgroundColor,
            ),
            .secondary => OutlinedButton.styleFrom(
              foregroundColor: foregroundColor,
              backgroundColor: backgroundColor,
            ),
            .tertiary => TextButton.styleFrom(
              foregroundColor: foregroundColor,
              backgroundColor: backgroundColor,
            ),
          }
        : null;

    if (icon != null && !isLoading) {
      return switch (type) {
        .primary => FilledButton.icon(
          onPressed: isDisabled ? null : onPressed,
          style: customStyle,
          icon: icon!,
          label: child,
        ),
        .secondary => OutlinedButton.icon(
          onPressed: isDisabled ? null : onPressed,
          style: customStyle,
          icon: icon!,
          label: child,
        ),
        .tertiary => TextButton.icon(
          onPressed: isDisabled ? null : onPressed,
          style: customStyle,
          icon: icon!,
          label: child,
        ),
      };
    }

    return switch (type) {
      .primary => FilledButton(
        onPressed: isDisabled ? null : onPressed,
        style: customStyle,
        child: child,
      ),
      .secondary => OutlinedButton(
        onPressed: isDisabled ? null : onPressed,
        style: customStyle,
        child: child,
      ),
      .tertiary => TextButton(
        onPressed: isDisabled ? null : onPressed,
        style: customStyle,
        child: child,
      ),
    };
  }
}
