/// Layer 1: Design System & UI Primitives for the Mahafez Platform.
///
/// Exports:
/// - Styling tokens ([MahafezColors], [MahafezColorExtension], [MahafezSpacing], [MahafezResponsive], [MahafezTheme])
/// - Primitive UI widgets ([MahafezButton], [MahafezTextField], [MahafezDialog], [MahafezLoader], [MahafezSnackbar], [MahafezErrorView], [MahafezInfoCard], [MahafezSkeletonBox])
library;

// Re-export Flutter ScreenUtil for responsive metrics & spacing widgets
export 'package:flutter_screenutil/flutter_screenutil.dart';

// Tokens & Theme
export 'src/tokens/mahafez_color_extension.dart';
export 'src/tokens/mahafez_colors.dart';
export 'src/tokens/mahafez_responsive.dart';
export 'src/tokens/mahafez_spacing.dart';
export 'src/tokens/mahafez_theme.dart';

// UI Primitives
export 'src/widgets/mahafez_button.dart';
export 'src/widgets/mahafez_dialog.dart';
export 'src/widgets/mahafez_error_view.dart';
export 'src/widgets/mahafez_info_card.dart';
export 'src/widgets/mahafez_loader.dart';
export 'src/widgets/mahafez_skeleton_box.dart';
export 'src/widgets/mahafez_snackbar.dart';
export 'src/widgets/mahafez_text_field.dart';
