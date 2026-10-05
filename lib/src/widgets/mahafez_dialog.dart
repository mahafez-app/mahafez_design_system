import 'package:flutter/material.dart';

import '../tokens/mahafez_responsive.dart';

abstract final class MahafezDialog {
  static Future<bool?> confirm(
    BuildContext context, {
    required String title,
    required String message,
    String confirmLabel = 'Confirm',
    String cancelLabel = 'Cancel',
    bool isDestructive = false,
  }) {
    final theme = Theme.of(context);

    return showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.responsiveRadius),
        ),
        title: Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        content: Text(
          message,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(cancelLabel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            style: FilledButton.styleFrom(
              backgroundColor: isDestructive
                  ? theme.colorScheme.error
                  : theme.colorScheme.primary,
              foregroundColor: isDestructive
                  ? theme.colorScheme.onError
                  : theme.colorScheme.onPrimary,
            ),
            child: Text(confirmLabel),
          ),
        ],
      ),
    );
  }

  static Future<void> info(
    BuildContext context, {
    required String title,
    required String message,
    String buttonLabel = 'OK',
  }) {
    final theme = Theme.of(context);

    return showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: .circular(20.responsiveRadius),
        ),
        title: Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: .w700,
          ),
        ),
        content: Text(
          message,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        actions: [
          FilledButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(buttonLabel),
          ),
        ],
      ),
    );
  }
}

