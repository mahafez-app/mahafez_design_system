import 'package:flutter/material.dart';
import 'package:mahafez_design_system/mahafez_design_system.dart';

void main() {
  runApp(const MahafezGalleryApp());
}

class MahafezGalleryApp extends StatefulWidget {
  const MahafezGalleryApp({super.key});

  @override
  State<MahafezGalleryApp> createState() => _MahafezGalleryAppState();
}

class _MahafezGalleryAppState extends State<MahafezGalleryApp> {
  ThemeMode _themeMode = .light;

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == .light ? .dark : .light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        title: 'Mahafez Design System Gallery',
        theme: MahafezTheme.light(),
        darkTheme: MahafezTheme.dark(),
        themeMode: _themeMode,
        home: GalleryHomeScreen(
          isDark: _themeMode == .dark,
          onToggleTheme: _toggleTheme,
        ),
      ),
    );
  }
}

class GalleryHomeScreen extends StatelessWidget {
  const GalleryHomeScreen({
    super.key,
    required this.isDark,
    required this.onToggleTheme,
  });

  final bool isDark;
  final VoidCallback onToggleTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mahafez Design System'),
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: onToggleTheme,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: MahafezSpacing.pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Buttons', style: Theme.of(context).textTheme.titleLarge),
            MahafezSpacing.md.verticalSpace,
            MahafezButton(
              label: 'Primary Button',
              onPressed: () {
                MahafezSnackbar.show(
                  context,
                  message: 'Primary button clicked',
                  type: .success,
                );
              },
            ),
            MahafezSpacing.md.verticalSpace,
            MahafezButton(
              label: 'Secondary Button',
              type: .secondary,
              onPressed: () {},
            ),
            MahafezSpacing.md.verticalSpace,
            MahafezButton(
              label: 'Tertiary Button',
              type: .tertiary,
              onPressed: () {},
            ),
            MahafezSpacing.md.verticalSpace,
            const MahafezButton(
              label: 'Loading Button',
              isLoading: true,
              onPressed: null,
            ),
            MahafezSpacing.xl.verticalSpace,
            Text('Text Field', style: Theme.of(context).textTheme.titleLarge),
            MahafezSpacing.md.verticalSpace,
            const MahafezTextField(
              hintText: 'Enter Egyptian mobile number (010...)',
              prefixIcon: Icon(Icons.phone),
            ),
            MahafezSpacing.xl.verticalSpace,
            Text('Modals & Feedback', style: Theme.of(context).textTheme.titleLarge),
            MahafezSpacing.md.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: MahafezButton(
                    label: 'Show Dialog',
                    onPressed: () {
                      MahafezDialog.confirm(
                        context,
                        title: 'Confirm Operation',
                        message: 'Are you sure you want to proceed?',
                      );
                    },
                  ),
                ),
                MahafezSpacing.md.horizontalSpace,
                Expanded(
                  child: MahafezButton(
                    label: 'Show Snackbar',
                    type: .secondary,
                    onPressed: () {
                      MahafezSnackbar.show(
                        context,
                        message: 'Transaction saved successfully',
                        type: .success,
                      );
                    },
                  ),
                ),
              ],
            ),
            MahafezSpacing.xl.verticalSpace,
            Text('Info Card', style: Theme.of(context).textTheme.titleLarge),
            MahafezSpacing.md.verticalSpace,
            const MahafezInfoCard(
              child: Text('This is a standardized MahafezInfoCard container.'),
            ),
            MahafezSpacing.xl.verticalSpace,
            Text('Skeleton & Loading', style: Theme.of(context).textTheme.titleLarge),
            MahafezSpacing.md.verticalSpace,
            Row(
              children: [
                const MahafezSkeletonBox(width: 80, height: 80, borderRadius: 16),
                MahafezSpacing.md.horizontalSpace,
                const MahafezSkeletonBox.circular(size: 60),
                MahafezSpacing.md.horizontalSpace,
                const Expanded(
                  child: Column(
                    children: [
                      MahafezSkeletonBox(width: 200, height: 16),
                      SizedBox(height: 8),
                      MahafezSkeletonBox(width: 140, height: 16),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
