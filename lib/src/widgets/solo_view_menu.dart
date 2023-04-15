
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SoloViewMenu extends HookWidget {
  const SoloViewMenu({
    Key? key,
    required this.children,
    this.cardColor,
    this.containerWidth,
    required this.cardPadding,
  }) : super(key: key);

  final List<Widget> children;
  final Color? cardColor;
  final double? containerWidth;
  final EdgeInsets cardPadding;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      elevation: 8,
      child: Padding(
        padding: cardPadding,
        child: Container(
          width: containerWidth,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: children,
          ),
        ),
      ),
    );
  }
}

