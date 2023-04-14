import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Constants {
  static var raisedButtonHeight =
      defaultTargetPlatform == TargetPlatform.android ? 50.0 : 49.0;
  static var bottomAppBarPadding = const EdgeInsets.fromLTRB(
    10.0,
    8.0,
    10.0,
    28.0,
  );

  static String twoDigits(int n) => n.toString().padLeft(2, '0');
}
