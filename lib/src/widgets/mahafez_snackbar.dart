import 'package:flutter/material.dart';

import '../tokens/mahafez_color_extension.dart';
import '../tokens/mahafez_responsive.dart';
import '../tokens/mahafez_spacing.dart';

enum MahafezSnackbarType { success, error, info, warning }

class MahafezSnackbar {
  const MahafezSnackbar._();

  static void Function(BuildContext context, Object failure, Duration duration)?
      failureHandler;

  static void showFailure(
    BuildContext context, {
    required Object failure,
    Duration duration = const Duration(seconds: 4),
  }) {
    if (failureHandler != null) {
      failureHandler!(context, failure, duration);
    } else {
      show(
        context,
        message: failure.toString(),
        type: .error,
        duration: duration,
      );
    }
  }

  static void show(
    BuildContext context, {
    required String message,
    MahafezSnackbarType type = .info,
    Duration duration = const Duration(seconds: 4),
  }) {
    final colors = context.mahafezColors;
    final theme = Theme.of(context);

    final (backgroundColor, foregroundColor, icon) = switch (type) {
      .success => (
        colors.successContainer,
        colors.success,
        Icons.check_circle_rounded,
      ),
      .error => (
        colors.dangerContainer,
        colors.danger,
        Icons.error_rounded,
      ),
      .warning => (
        colors.warningContainer,
        colors.warning,
        Icons.warning_rounded,
      ),
      .info => (
        colors.infoContainer,
        colors.info,
        Icons.info_rounded,
      ),
    };

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: duration,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: Container(
          padding: MahafezResponsive.symmetricPadding(
            horizontal: MahafezSpacing.md,
            vertical: MahafezSpacing.sm,
          ),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(16.responsiveRadius),
            border: Border.all(color: backgroundColor, width: 1.5),
            boxShadow: [
              BoxShadow(
                color: colors.cardShadow,
                blurRadius: 12.responsiveRadius,
                offset: Offset(0, 4.responsiveHeight),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: MahafezResponsive.allPadding(MahafezSpacing.xs),
                decoration: BoxDecoration(
                  color: backgroundColor.withAlpha(50),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: foregroundColor,
                  size: 20.responsiveRadius,
                ),
              ),
              MahafezSpacing.md.horizontalSpace,
              Expanded(
                child: Text(
                  message,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurface,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
