import 'package:example/widgets/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ElevatedButtonWithIconOnly extends HookWidget {
  const ElevatedButtonWithIconOnly({
    super.key,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.icons,
    required this.onTap,
    this.scale,
  });

  final Color backgroundColor;
  final Color foregroundColor;
  final Icon icons;
  final Function() onTap;
  final double? scale;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale ?? 0.7,
      child: ElevatedCustomButton(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        hasIcon: true,
        hasTextWithIcon: false,
        icons: icons,
        onTap: onTap,
        title: "",
        clipTopRightAndBottomLeft: false,
        padding:  const EdgeInsets.symmetric(
          horizontal: 6,
        ),
      ),
    );
  }
}
