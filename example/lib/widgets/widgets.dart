
import 'package:example/utils%20/constant/colors.dart';
import 'package:example/widgets/elevated_button.dart';
import 'package:flutter/material.dart';

/// This is a function that returns an elevated custom button with an icon, title, and specified colors
/// and properties.
/// 
/// Args:
///   clipTopRightAndBottomLeft (bool): A boolean value that determines whether the top right and bottom
/// left corners of the button should be clipped or not.
///   icons (Icon): An optional parameter of type Icon that represents the icon to be displayed on the
/// button.
///   onTap (Function()): A required function that will be called when the button is tapped.
///   title (String): A required string parameter that specifies the text to be displayed on the button.
///   backgroundColor (Color): The background color of the button.
///   foregroundColor (Color): The foregroundColor parameter is a required Color that specifies the
/// color of the text and icon in the button.
/// 
/// Returns:
///   The function `elevatedRowButton` is returning an `ElevatedCustomButton` widget with the given
/// parameters.
elevatedRowButton({
  required bool clipTopRightAndBottomLeft,
  Icon? icons,
  required Function() onTap,
  required String title,
  required Color backgroundColor,
  required Color foregroundColor,
}) {
  return ElevatedCustomButton(
    clipTopRightAndBottomLeft: clipTopRightAndBottomLeft,
    hasIcon: icons == null ? false : true,
    hasTextWithIcon: true,
    icons: icons,
    isDisabledButton: false,
    onTap: onTap,
    title: title,
    backgroundColor: backgroundColor,
    foregroundColor: foregroundColor,
    padding: const EdgeInsets.symmetric(
      horizontal: 6,
    ),
  );
}


/// The CardItemsWidget class is a stateless widget that displays an icon and text in a row and can be
/// tapped to trigger a function.
class CardItemsWidget extends StatelessWidget {
  const CardItemsWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.ontap,
  });
  final Icon icon;
  final String text;
  final Function() ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 18,
      ),
      child: InkWell(
        onTap: ontap,
        child: Row(
          children: [
            icon,
            const SizedBox(
              width: 8.78,
            ),
            Text(
              text,
              style: TextStyle(
                color: whiteMain.withOpacity(
                  .8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
