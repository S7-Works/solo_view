import 'package:example/utils%20/constant/colors.dart';
import 'package:example/utils%20/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


class ElevatedCustomButton extends HookConsumerWidget {
  final Icon? icons;
  final String title;
  final Color backgroundColor;
  final Color foregroundColor;
  final bool hasIcon;
  final String? subTitle;
  final bool isDisabledButton;
  final bool hasTextWithIcon;
  final Size minimumSize;
  final bool clipTopRightAndBottomLeft;
  final EdgeInsets? padding;
  final bool hasTextStyle;
  final TextStyle? textStyleSent;
  final Function() onTap;
  const ElevatedCustomButton({
    Key? key,
    this.icons,
    this.subTitle,
    required this.title,
    required this.backgroundColor,
    required this.foregroundColor,
    this.isDisabledButton = false,
    required this.hasIcon,
    required this.onTap,
    this.hasTextWithIcon = false,
    this.minimumSize = const Size(0, 0),
    required this.clipTopRightAndBottomLeft,
    required this.padding,
    this.hasTextStyle = false,
    this.textStyleSent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var textStyleMain = const TextStyle(
      fontSize: 14,
    );

    return MaterialSlashedEdgesWidget(
        backgroundColor: backgroundColor,
        clipTopRightAndBottomLeft: clipTopRightAndBottomLeft,
        child: hasIcon
            ? ConstrainedBox(
                constraints: BoxConstraints.tightFor(
                  height: Constants.raisedButtonHeight,
                ),
                child: ElevatedButton.icon(
                  onPressed: isDisabledButton ? null : onTap,
                  icon: icons!,
                  label: hasTextWithIcon
                      ? Text(
                          title,
                        )
                      : const SizedBox.shrink(),
                  style: !hasTextWithIcon
                      ? ButtonStyle(
                          // padding: MaterialStateProperty.all(EdgeInsets.zero),
                          minimumSize: MaterialStateProperty.all(minimumSize),
                          elevation: MaterialStateProperty.all(0.0),
                          textStyle: MaterialStateProperty.all(
                            hasTextStyle ? textStyleSent : textStyleMain,
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                0.0,
                              ),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(backgroundColor),
                          foregroundColor:
                              MaterialStateProperty.all(foregroundColor),
                        )
                      : ElevatedButton.styleFrom(
                          minimumSize: minimumSize,
                          disabledForegroundColor: blackMain,
                          disabledBackgroundColor: buttonBackground,
                          elevation: 0.0,
                          textStyle:
                              hasTextStyle ? textStyleSent : textStyleMain,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              0.0,
                            ),
                          ),
                          backgroundColor: backgroundColor,
                          foregroundColor: foregroundColor,
                        ),
                ),
              )
            : ConstrainedBox(
                constraints: BoxConstraints.tightFor(
                  height: Constants.raisedButtonHeight,
                ),
                child: ElevatedButton(
                  onPressed: isDisabledButton ? null : onTap,
                  style: ElevatedButton.styleFrom(
                    padding: padding,
                    minimumSize: minimumSize,
                    disabledForegroundColor: blackMain,
                    disabledBackgroundColor: buttonBackground,
                    elevation: 0.0,
                    textStyle: hasTextStyle ? textStyleSent : textStyleMain,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        0.0,
                      ),
                    ),
                    backgroundColor: backgroundColor,
                    foregroundColor: foregroundColor,
                  ),
                  child: Text(
                    title,
                  ),
                ),
              ));
  }
}

class MaterialSlashedEdgesWidget extends StatelessWidget {
  const MaterialSlashedEdgesWidget({
    super.key,
    required this.child,
    required this.backgroundColor,
    required this.clipTopRightAndBottomLeft,
  });
  final Widget child;
  final Color backgroundColor;
  final bool clipTopRightAndBottomLeft;

  @override
  Widget build(BuildContext context) {
    return Material(
        clipBehavior: Clip.antiAlias,
        color: backgroundColor,
        shape: BeveledRectangleBorder(
          borderRadius: clipTopRightAndBottomLeft
              ? const BorderRadius.only(
                  topRight: Radius.circular(
                    15.0,
                  ),
                  bottomLeft: Radius.circular(
                    15.0,
                  ),
                  topLeft: Radius.circular(
                    1,
                  ),
                  bottomRight: Radius.circular(
                    1,
                  ),
                )
              : const BorderRadius.only(
                  topLeft: Radius.circular(
                    15.0,
                  ),
                  bottomRight: Radius.circular(
                    15.0,
                  ),
                  topRight: Radius.circular(
                    1,
                  ),
                  bottomLeft: Radius.circular(
                    1,
                  ),
                ),
        ),
        child: child);
  }
}
