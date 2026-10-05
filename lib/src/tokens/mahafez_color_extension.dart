import 'package:flutter/material.dart';

import 'mahafez_colors.dart';

@immutable
class MahafezColorExtension extends ThemeExtension<MahafezColorExtension> {
  const MahafezColorExtension({
    required this.success,
    required this.onSuccess,
    required this.successContainer,
    required this.onSuccessContainer,
    required this.warning,
    required this.onWarning,
    required this.warningContainer,
    required this.onWarningContainer,
    required this.info,
    required this.onInfo,
    required this.infoContainer,
    required this.onInfoContainer,
  });

  const MahafezColorExtension.light()
    : success = const Color(0xFF16A34A),
      onSuccess = MahafezColors.white,
      successContainer = const Color(0xFFDCFCE7),
      onSuccessContainer = const Color(0xFF14532D),
      warning = const Color(0xFFD97706),
      onWarning = MahafezColors.white,
      warningContainer = const Color(0xFFFEF3C7),
      onWarningContainer = const Color(0xFF78350F),
      info = const Color(0xFF0284C7),
      onInfo = MahafezColors.white,
      infoContainer = const Color(0xFFE0F2FE),
      onInfoContainer = const Color(0xFF075985);

  const MahafezColorExtension.dark()
    : success = const Color(0xFF4ADE80),
      onSuccess = const Color(0xFF052E16),
      successContainer = const Color(0xFF14532D),
      onSuccessContainer = const Color(0xFFDCFCE7),
      warning = const Color(0xFFFBBF24),
      onWarning = const Color(0xFF451A03),
      warningContainer = const Color(0xFF78350F),
      onWarningContainer = const Color(0xFFFEF3C7),
      info = const Color(0xFF38BDF8),
      onInfo = const Color(0xFF082F49),
      infoContainer = const Color(0xFF075985),
      onInfoContainer = const Color(0xFFE0F2FE);

  final Color success;
  final Color onSuccess;
  final Color successContainer;
  final Color onSuccessContainer;

  final Color warning;
  final Color onWarning;
  final Color warningContainer;
  final Color onWarningContainer;

  final Color info;
  final Color onInfo;
  final Color infoContainer;
  final Color onInfoContainer;

  @override
  MahafezColorExtension copyWith({
    Color? success,
    Color? onSuccess,
    Color? successContainer,
    Color? onSuccessContainer,
    Color? warning,
    Color? onWarning,
    Color? warningContainer,
    Color? onWarningContainer,
    Color? info,
    Color? onInfo,
    Color? infoContainer,
    Color? onInfoContainer,
  }) {
    return MahafezColorExtension(
      success: success ?? this.success,
      onSuccess: onSuccess ?? this.onSuccess,
      successContainer: successContainer ?? this.successContainer,
      onSuccessContainer: onSuccessContainer ?? this.onSuccessContainer,
      warning: warning ?? this.warning,
      onWarning: onWarning ?? this.onWarning,
      warningContainer: warningContainer ?? this.warningContainer,
      onWarningContainer: onWarningContainer ?? this.onWarningContainer,
      info: info ?? this.info,
      onInfo: onInfo ?? this.onInfo,
      infoContainer: infoContainer ?? this.infoContainer,
      onInfoContainer: onInfoContainer ?? this.onInfoContainer,
    );
  }

  @override
  MahafezColorExtension lerp(
    ThemeExtension<MahafezColorExtension>? other,
    double t,
  ) {
    if (other is! MahafezColorExtension) return this;
    return MahafezColorExtension(
      success: Color.lerp(success, other.success, t) ?? success,
      onSuccess: Color.lerp(onSuccess, other.onSuccess, t) ?? onSuccess,
      successContainer:
          Color.lerp(successContainer, other.successContainer, t) ??
          successContainer,
      onSuccessContainer:
          Color.lerp(onSuccessContainer, other.onSuccessContainer, t) ??
          onSuccessContainer,
      warning: Color.lerp(warning, other.warning, t) ?? warning,
      onWarning: Color.lerp(onWarning, other.onWarning, t) ?? onWarning,
      warningContainer:
          Color.lerp(warningContainer, other.warningContainer, t) ??
          warningContainer,
      onWarningContainer:
          Color.lerp(onWarningContainer, other.onWarningContainer, t) ??
          onWarningContainer,
      info: Color.lerp(info, other.info, t) ?? info,
      onInfo: Color.lerp(onInfo, other.onInfo, t) ?? onInfo,
      infoContainer:
          Color.lerp(infoContainer, other.infoContainer, t) ?? infoContainer,
      onInfoContainer:
          Color.lerp(onInfoContainer, other.onInfoContainer, t) ??
          onInfoContainer,
    );
  }
}

extension MahafezColorExtensionGetter on BuildContext {
  MahafezColorExtension get mahafezColors =>
      Theme.of(this).extension<MahafezColorExtension>() ??
      const MahafezColorExtension.light();
}

