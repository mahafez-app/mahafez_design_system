import 'package:flutter/material.dart';

import '../tokens/mahafez_color_extension.dart';
import '../tokens/mahafez_responsive.dart';
import '../tokens/mahafez_spacing.dart';
import 'mahafez_button.dart';

enum MahafezDialogType { success, error, info, warning }

class MahafezDialog extends StatelessWidget {
  final String title;
  final String message;
  final String? confirmLabel;
  final String? cancelLabel;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final MahafezDialogType type;

  const MahafezDialog({
    super.key,
    required this.title,
    required this.message,
    this.confirmLabel,
    this.cancelLabel,
    this.onConfirm,
    this.onCancel,
    this.type = .info,
  });

  static Future<T?> show<T>(
    BuildContext context, {
    required String title,
    required String message,
    String? confirmLabel,
    String? cancelLabel,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    MahafezDialogType type = .info,
  }) {
    return showDialog<T>(
      context: context,
      builder: (context) => MahafezDialog(
        title: title,
        message: message,
        confirmLabel: confirmLabel,
        cancelLabel: cancelLabel,
        onConfirm: onConfirm,
        onCancel: onCancel,
        type: type,
      ),
    );
  }

  static Future<bool?> confirm(
    BuildContext context, {
    required String title,
    required String message,
    String confirmLabel = 'Confirm',
    String cancelLabel = 'Cancel',
    bool isDestructive = false,
  }) {
    return show<bool>(
      context,
      title: title,
      message: message,
      confirmLabel: confirmLabel,
      cancelLabel: cancelLabel,
      type: isDestructive ? .error : .info,
      onConfirm: () => Navigator.of(context).pop(true),
      onCancel: () => Navigator.of(context).pop(false),
    );
  }

  static Future<void> info(
    BuildContext context, {
    required String title,
    required String message,
    String buttonLabel = 'OK',
  }) {
    return show<void>(
      context,
      title: title,
      message: message,
      confirmLabel: buttonLabel,
      type: .info,
      onConfirm: () => Navigator.of(context).pop(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.mahafezColors;
    final theme = Theme.of(context);

    final (backgroundColor, foregroundColor, icon) = switch (type) {
      .success => (
        colors.successContainer,
        colors.success,
        Icons.check_circle_outline_rounded,
      ),
      .error => (
        colors.dangerContainer,
        colors.danger,
        Icons.error_outline_rounded,
      ),
      .warning => (
        colors.warningContainer,
        colors.warning,
        Icons.warning_amber_rounded,
      ),
      .info => (
        colors.infoContainer,
        colors.info,
        Icons.info_outline_rounded,
      ),
    };

    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: MahafezResponsive.allPadding(MahafezSpacing.xl),
      child: Container(
        padding: MahafezResponsive.allPadding(MahafezSpacing.xl),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(32.responsiveRadius),
          boxShadow: [
            BoxShadow(
              color: colors.cardShadow.withAlpha(120),
              blurRadius: 30,
              offset: Offset(0, 15.responsiveHeight),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: MahafezResponsive.allPadding(MahafezSpacing.lg),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    backgroundColor.withAlpha(80),
                    backgroundColor.withAlpha(30),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
                border: Border.all(
                  color: backgroundColor.withAlpha(100),
                  width: 1,
                ),
              ),
              child: Icon(
                icon,
                color: foregroundColor,
                size: 56.responsiveRadius,
              ),
            ),
            MahafezSpacing.xl.verticalSpace,
            Text(
              title,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w900,
                letterSpacing: -0.5,
              ),
              textAlign: TextAlign.center,
            ),
            MahafezSpacing.md.verticalSpace,
            Text(
              message,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            MahafezSpacing.xxl.verticalSpace,
            Row(
              children: [
                if (cancelLabel != null)
                  Expanded(
                    child: MahafezButton(
                      label: cancelLabel!,
                      type: .tertiary,
                      onPressed: onCancel ?? () => Navigator.pop(context),
                    ),
                  ),
                if (confirmLabel != null) ...[
                  if (cancelLabel != null) MahafezSpacing.md.horizontalSpace,
                  Expanded(
                    child: MahafezButton(
                      label: confirmLabel!,
                      backgroundColor:
                          (type == .error || type == .warning)
                              ? foregroundColor
                              : null,
                      foregroundColor:
                          (type == .error || type == .warning)
                              ? Colors.white
                              : null,
                      onPressed: onConfirm ?? () => Navigator.pop(context),
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
