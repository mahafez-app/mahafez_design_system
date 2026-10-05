# 🎨 Mahafez Design System (`mahafez_design_system`)

[![Architecture Layer](https://img.shields.io/badge/Layer-Core%20%2F%20Platform%20(L1)-blue.svg)]()
[![Platform](https://img.shields.io/badge/Framework-Flutter-02569B.svg)]()
[![Typography](https://img.shields.io/badge/Typography-Cairo%20Font-purple.svg)]()

> Part of the **Mahafez Platform Architecture**. The single source of truth for Cairo typography, color palettes, responsive scaling, spacing tokens, and primitive UI widgets.

---

## 📐 Architecture Classification
* **Layer:** **Layer 1 (Core / Platform)**
* **Dependencies:** Flutter SDK + `flutter_screenutil` + `mahafez_core`.
* **Strict Rule:** Contains **ZERO** domain logic and **ZERO** product-specific widgets (`WalletCard`, `TransactionTile` are excluded).

---

## 🚀 Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  mahafez_design_system:
    git:
      url: https://github.com/mahafez-app/mahafez_design_system.git
      ref: v1.0.0
```

---

## 📖 Public API & Usage

```dart
import 'package:mahafez_design_system/mahafez_design_system.dart';

// 1. App Themes (with Cairo font integration)
MaterialApp(
  theme: AppTheme.light(),
  darkTheme: AppTheme.dark(),
);

// 2. UI Primitives
AppButton(
  label: 'Continue',
  onPressed: () {},
);

AppTextField(
  hintText: 'Enter phone number',
  keyboardType: TextInputType.phone,
);

AppSnackbar.show(
  context,
  message: 'Saved successfully',
  type: AppSnackbarType.success,
);
```
