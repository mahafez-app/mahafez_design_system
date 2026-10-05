import 'package:flutter/material.dart';

import '../tokens/mahafez_responsive.dart';

class MahafezSkeletonBox extends StatefulWidget {
  const MahafezSkeletonBox({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.shape = BoxShape.rectangle,
    this.child,
  });

  const MahafezSkeletonBox.circular({
    super.key,
    required double size,
    this.child,
  })  : width = size,
        height = size,
        borderRadius = null,
        shape = BoxShape.circle;

  final double? width;
  final double? height;
  final BorderRadiusGeometry? borderRadius;
  final BoxShape shape;
  final Widget? child;

  @override
  State<MahafezSkeletonBox> createState() => _MahafezSkeletonBoxState();
}

class _MahafezSkeletonBoxState extends State<MahafezSkeletonBox>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1100),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final baseColor = colorScheme.surfaceContainerHighest.withAlpha(130);
    final highlightColor = colorScheme.surfaceContainerLow.withAlpha(230);

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final color = Color.lerp(baseColor, highlightColor, _controller.value);

        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: color,
            shape: widget.shape,
            borderRadius: widget.shape == BoxShape.circle
                ? null
                : widget.borderRadius ??
                      BorderRadius.circular(16.responsiveRadius),
          ),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
