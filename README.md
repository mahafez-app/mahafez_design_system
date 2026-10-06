# mahafez_design_system

Layer 1 Flutter UI foundation for Mahafez. It provides shared visual tokens, Cairo font assets, theme primitives, responsive sizing and reusable generic widgets.

## Architecture role

The design system is a platform presentation foundation. It may depend on Flutter and generic UI libraries, but it must not depend on services, products or the app and must not contain wallet-, identity- or workspace-specific behavior. The current package manifest does not declare `mahafez_core` as a dependency.

## Use

```yaml
dependencies:
  mahafez_design_system:
    git:
      url: https://github.com/mahafez-app/mahafez_design_system.git
      ref: v1.0.2
```

```dart
import 'package:mahafez_design_system/mahafez_design_system.dart';
```

Use exported typography, colors, spacing, responsive helpers and generic UI components instead of recreating shared primitives in product packages.
