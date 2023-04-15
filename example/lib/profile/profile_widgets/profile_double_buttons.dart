import 'package:example/utils%20/constant/colors.dart';
import 'package:example/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:solo_view/solo_view.dart';

final isShowMenuStateProvider = StateProvider<bool>((ref) => false);
final isShowSoundStateProvider = StateProvider<bool>((ref) => false);

class ProfileEditDoubleButtons extends HookConsumerWidget {
  const ProfileEditDoubleButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showMenu = ref.watch(isShowMenuStateProvider);
    final showSound = ref.watch(isShowSoundStateProvider);

    return Row(
      children: [
        SoloViewBarrier(
          cardPadding: const EdgeInsets.only(
            top: 12.0,
            left: 12.0,
            right: 12.0,
            bottom: 12.0,
          ),
                    containerWidth: 205,
          visibility: showSound,
          follower: Alignment.topLeft,
          target: Alignment.bottomLeft,
          items: [
            CardItemsWidget(
              icon: Icon(
                MdiIcons.bellRing,
                color: whiteMain.withOpacity(
                  .8,
                ),
              ),
              text: "Turn Off For A While",
              ontap: () {},
            ),
            CardItemsWidget(
              icon: Icon(
                MdiIcons.volumeMute,
                color: whiteMain.withOpacity(
                  .8,
                ),
              ),
              text: "Turn Off The Sound",
              ontap: () {},
            ),
            CardItemsWidget(
              icon: Icon(
                MdiIcons.bellOff,
                color: whiteMain.withOpacity(
                  .8,
                ),
              ),
              text: "Turn Off Notifications",
              ontap: () {},
            ),
          ],
          onClose: () =>
              ref.read(isShowMenuStateProvider.notifier).state = false,
          childItem: elevatedRowButton(
            clipTopRightAndBottomLeft: true,
            icons: const Icon(
              MdiIcons.bellOff,
            ),
            title: "Sound",
            onTap: () {
              ref.read(isShowSoundStateProvider.notifier).state = !showSound;
            },
            backgroundColor: buttonColor,
            foregroundColor: whiteMain,
          ),
          cardColor: modalBackGround,
        ),
        const SizedBox(
          width: 6,
        ),
        SoloViewBarrier(
          cardPadding: const EdgeInsets.only(
            top: 12.0,
            left: 12.0,
            right: 12.0,
            bottom: 12.0,
          ),
                    containerWidth: 205,
          visibility: showMenu,
          follower: Alignment.topRight,
          target: Alignment.bottomRight,
          items: [
            CardItemsWidget(
              icon: Icon(
                MdiIcons.chatProcessing,
                color: whiteMain.withOpacity(
                  .8,
                ),
              ),
              text: "Delete Conversation",
              ontap: () {},
            ),
            CardItemsWidget(
              icon: Icon(
                Icons.logout,
                color: whiteMain.withOpacity(
                  .8,
                ),
              ),
              text: "leave The Group",
              ontap: () {},
            ),
            CardItemsWidget(
              icon: Icon(
                MdiIcons.closeBox,
                color: whiteMain.withOpacity(
                  .8,
                ),
              ),
              text: "Delete Group",
              ontap: () {},
            ),
          ],
          onClose: () =>
              ref.read(isShowMenuStateProvider.notifier).state = false,
          childItem: elevatedRowButton(
            clipTopRightAndBottomLeft: false,
            icons: const Icon(
              MdiIcons.dotsHorizontal,
            ),
            title: "More",
            onTap: () {
              ref.read(isShowMenuStateProvider.notifier).state = !showMenu;
            },
            backgroundColor: buttonColor,
            foregroundColor: whiteMain,
          ),
          cardColor: Colors.amber,
        ),
      ],
    );
  }
}
