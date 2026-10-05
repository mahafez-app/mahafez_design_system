import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mahafez_design_system/mahafez_design_system.dart';

void main() {
  testWidgets('Verify font resolution from package', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: MahafezTheme.light(),
        home: const Scaffold(
          body: Text('تجربة الخط'),
        ),
      ),
    );

    expect(find.text('تجربة الخط'), findsOneWidget);
  });
}
