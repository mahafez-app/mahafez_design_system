import 'package:flutter/material.dart';

import '../tokens/mahafez_color_extension.dart';
import '../tokens/mahafez_responsive.dart';
import '../tokens/mahafez_spacing.dart';

enum MahafezSnackbarType { success, error, info, warning }

class MahafezSnackbar {
  const MahafezSnackbar._();

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
        theme.colorScheme.errorContainer,
        theme.colorScheme.error,
        Icons.error_outline_rounded,
      ),
      .warning => (
        colors.warningContainer,
        colors.warning,
        Icons.warning_amber_rounded,
      ),
      .info => (colors.infoContainer, colors.info, Icons.info_outline_rounded),
    };

    final messenger = ScaffoldMessenger.of(context);
    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(
      SnackBar(
        duration: duration,
        backgroundColor: Colors.transparent,
        elevation: 0,
        behavior: .floating,
        margin: MahafezResponsive.allPadding(MahafezSpacing.lg),
        padding: .zero,
        content: Container(
          padding: MahafezResponsive.symmetricPadding(
            horizontal: MahafezSpacing.lg,
            vertical: MahafezSpacing.md,
          ),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: .circular(16.responsiveRadius),
            border: .all(color: foregroundColor.withAlpha(40), width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(15),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(icon, color: foregroundColor, size: 20.responsiveRadius),
              MahafezSpacing.md.horizontalSpace,
              Expanded(
                child: Text(
                  message,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurface,
                    fontWeight: .w600,
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
