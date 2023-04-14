import 'package:example/utils%20/constant/colors.dart';
import 'package:example/widgets/elevated_button_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BackButtonWidget extends HookWidget {
  const BackButtonWidget({
    super.key,
    this.backgroundColor,
    this.foregroundColor,
  });
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButtonWithIconOnly(
      backgroundColor: backgroundColor ?? buttonBackground,
      foregroundColor: foregroundColor ?? blackMain,
      icons: const Icon(
        Icons.arrow_back,
        size: 20,
      ),
      onTap: () {
      },
    );
  }
}
