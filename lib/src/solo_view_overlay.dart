import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:solo_view/src/widgets/solo_view_barrier.dart';
import 'package:solo_view/src/widgets/solo_view_hole_painter.dart';
import 'package:solo_view/src/widgets/solo_view_menu.dart';
import 'package:solo_view/src/widgets/solo_view_modal.dart';

class SoloViewBarrier extends HookWidget {
  const SoloViewBarrier({
    super.key,
    required this.visibility,
    required this.items,
    required this.onClose,
    required this.childItem,
    this.cardColor,
    required this.follower,
    required this.target,
    required this.containerWidth,
    required this.cardPadding,
  });
  final bool visibility;
  final List<Widget> items;
  final bool Function() onClose;
  final childItem;
  final Color? cardColor;
  final Alignment follower;
  final Alignment target;
  final double containerWidth;
  final EdgeInsets cardPadding;
  @override
  Widget build(BuildContext context) {
    return BarrierSoloView(
      visible: visibility,
      onClose: onClose,
      child: SoloViewModalEntry(
        visible: visibility,
        onClose: onClose,
        follower: follower,
        target: target,
        menu: SoloViewMenu(
          children: items,
          cardColor: cardColor,
          containerWidth: containerWidth,
          cardPadding: cardPadding,
        ),
        child: PortalTarget(
          visible: visibility,
          closeDuration: kThemeAnimationDuration,
          anchor: const Aligned(
            target: Alignment.center,
            follower: Alignment.center,
          ),
          portalFollower: Stack(
            children: [
              CustomPaint(
                painter: SoloViewHolePainter(
                    Theme.of(context).colorScheme.secondary),
                child: TweenAnimationBuilder<double>(
                  duration: kThemeAnimationDuration,
                  curve: Curves.easeOut,
                  tween: Tween(begin: 50, end: visibility ? 200 : 50),
                  builder: (context, radius, _) {
                    return childItem;
                  },
                ),
              )
            ],
          ),
          child: childItem,
        ),
      ),
    );
  }
}
