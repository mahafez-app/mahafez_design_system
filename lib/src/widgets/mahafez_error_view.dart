import 'package:flutter/material.dart';

import '../tokens/mahafez_responsive.dart';
import '../tokens/mahafez_spacing.dart';
import 'mahafez_button.dart';

/// Standard primitive error view widget for error states.
class MahafezErrorView extends StatelessWidget {
  const MahafezErrorView({
    super.key,
    required this.message,
    this.onRetry,
    this.retryLabel = 'Retry',
  });

  final String message;
  final VoidCallback? onRetry;
  final String retryLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: MahafezResponsive.allPadding(MahafezSpacing.xxl),
        child: Column(
          mainAxisSize: .min,
          children: [
            Container(
              padding: MahafezResponsive.allPadding(MahafezSpacing.xl),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    theme.colorScheme.error.withAlpha(40),
                    theme.colorScheme.error.withAlpha(10),
                  ],
                  begin: .topLeft,
                  end: .bottomRight,
                ),
                shape: .circle,
                border: .all(
                  color: theme.colorScheme.error.withAlpha(50),
                  width: 1,
                ),
              ),
              child: Icon(
                Icons.error_outline_rounded,
                size: 64.responsiveRadius,
                color: theme.colorScheme.error,
              ),
            ),
            MahafezSpacing.xl.verticalSpace,
            Text(
              message,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.w900,
                height: 1.5,
              ),
            ),
            if (onRetry != null) ...[
              MahafezSpacing.xxl.verticalSpace,
              MahafezButton(
                label: retryLabel,
                icon: const Icon(Icons.refresh_rounded),
                onPressed: onRetry!,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
