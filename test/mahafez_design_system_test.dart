import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mahafez_design_system/mahafez_design_system.dart';

void main() {
  group('Mahafez Design Tokens Tests', () {
    test('MahafezColors brand constants are defined', () {
      expect(MahafezColors.primary, const Color(0xFF0058BE));
      expect(MahafezColors.secondary, const Color(0xFF006C49));
      expect(MahafezColors.error, const Color(0xFFEF4444));
    });

    test('MahafezSpacing scale follows design grid', () {
      expect(MahafezSpacing.xs, 4.0);
      expect(MahafezSpacing.sm, 8.0);
      expect(MahafezSpacing.md, 12.0);
      expect(MahafezSpacing.lg, 16.0);
      expect(MahafezSpacing.xl, 24.0);
      expect(MahafezSpacing.xxl, 32.0);
    });

    test('MahafezTheme creates valid light and dark themes with Cairo font', () {
      final lightTheme = MahafezTheme.light();
      final darkTheme = MahafezTheme.dark();

      expect(lightTheme.useMaterial3, isTrue);
      expect(darkTheme.useMaterial3, isTrue);
      expect(lightTheme.textTheme.bodyMedium?.fontFamily, 'Cairo');
      expect(darkTheme.textTheme.bodyMedium?.fontFamily, 'Cairo');
    });
  });

  group('Mahafez UI Primitives Widget Tests', () {
    testWidgets('MahafezButton renders label and handles tap', (tester) async {
      var tapped = false;

      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (_, child) => MaterialApp(
            home: Scaffold(
              body: MahafezButton(
                label: 'Click Me',
                onPressed: () => tapped = true,
              ),
            ),
          ),
        ),
      );

      expect(find.text('Click Me'), findsOneWidget);
      await tester.tap(find.text('Click Me'));
      expect(tapped, isTrue);
    });

    testWidgets('MahafezErrorView renders error message', (tester) async {
      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (_, child) => const MaterialApp(
            home: Scaffold(
              body: MahafezErrorView(
                message: 'Something went wrong',
              ),
            ),
          ),
        ),
      );

      expect(find.text('Something went wrong'), findsOneWidget);
      expect(find.byIcon(Icons.error_outline_rounded), findsOneWidget);
    });

    testWidgets('Renders text with MahafezTheme without errors', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: MahafezTheme.light(),
          darkTheme: MahafezTheme.dark(),
          home: const Scaffold(
            body: Text('تجربة خط الحافظة'),
          ),
        ),
      );

      expect(find.text('تجربة خط الحافظة'), findsOneWidget);
    });
  });
}

