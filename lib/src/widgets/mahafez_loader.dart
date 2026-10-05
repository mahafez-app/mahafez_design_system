import 'package:flutter/material.dart';

import '../tokens/mahafez_responsive.dart';

class MahafezLoader extends StatefulWidget {
  const MahafezLoader({super.key});

  @override
  State<MahafezLoader> createState() => _MahafezLoaderState();
}

class _MahafezLoaderState extends State<MahafezLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return SizedBox(
            width: 48.responsiveWidth,
            height: 48.responsiveHeight,
            child: CircularProgressIndicator(
              strokeWidth: 3.5,
              valueColor: AlwaysStoppedAnimation(theme.colorScheme.primary),
            ),
          );
        },
      ),
    );
  }
}

