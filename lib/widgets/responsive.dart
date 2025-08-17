import 'package:flutter/material.dart';

const double kDesktopBreakpoint = 960;

bool isDesktop(BuildContext context) => MediaQuery.sizeOf(context).width >= kDesktopBreakpoint;

class MaxWidth extends StatelessWidget {
  final double maxWidth;
  final Widget child;
  const MaxWidth({super.key, this.maxWidth = 1200, required this.child});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(constraints: BoxConstraints(maxWidth: maxWidth), child: child),
    );
  }
}
