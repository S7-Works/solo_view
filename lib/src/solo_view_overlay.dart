import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_portal/flutter_portal.dart';

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
  });
  final bool visibility;
  final List<Widget> items;
  final bool Function() onClose;
  final childItem;
  final Color? cardColor;
  final Alignment follower;
  final Alignment target;
  @override
  Widget build(BuildContext context) {
    return Portal(
      child: Barrier(
        visible: visibility,
        onClose: onClose,
        child: ModalEntry(
          visible: visibility,
          onClose: onClose,
          follower: follower,
          target: target,
          menu: Menu(
            children: items,
            cardColor: cardColor,
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
                  painter: HolePainter(Theme.of(context).colorScheme.secondary),
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
      ),
    );
  }
}

class HolePainter extends CustomPainter {
  const HolePainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = color;
  }

  @override
  bool shouldRepaint(HolePainter oldDelegate) {
    return color != oldDelegate.color;
  }
}

class Menu extends StatelessWidget {
  const Menu({
    Key? key,
    required this.children,
    this.cardColor,
  }) : super(key: key);

  final List<Widget> children;
  final Color? cardColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      elevation: 8,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }
}

class ModalEntry extends HookWidget {
  const ModalEntry({
    Key? key,
    required this.onClose,
    required this.menu,
    required this.visible,
    required this.child,
    required this.follower,
    required this.target,
  }) : super(key: key);

  final VoidCallback onClose;
  final Widget menu;
  final bool visible;
  final Widget child;
  final Alignment follower;
  final Alignment target;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: visible ? onClose : null,
      child: PortalTarget(
        visible: visible,
        portalFollower: menu,
        anchor: Aligned(
          follower: follower,
          target: target,
        ),
        child: IgnorePointer(
          ignoring: visible,
          child: child,
        ),
      ),
    );
  }
}

class Barrier extends HookWidget {
  const Barrier({
    Key? key,
    required this.onClose,
    required this.visible,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final VoidCallback onClose;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return PortalTarget(
      visible: visible,
      closeDuration: kThemeAnimationDuration,
      portalFollower: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onClose,
        child: TweenAnimationBuilder<Color?>(
          duration: kThemeAnimationDuration,
          tween: ColorTween(
            begin: Colors.transparent,
            end: visible ? Colors.black54 : Colors.transparent,
          ),
          builder: (context, color, child) {
            return ColoredBox(color: color!);
          },
        ),
      ),
      child: child,
    );
  }
}
