import 'package:example/profile/profile_widgets/profile_double_buttons.dart';
import 'package:example/utils%20/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


class ProfileSectionBody extends HookConsumerWidget {
  const ProfileSectionBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
               
                const Text(
                  "Vrbshki,",
                  style: TextStyle(
                    color: whiteMain,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  " 4 ",
                  style: TextStyle(
                    color: whiteMain.withOpacity(.5),
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: 24,
                  ),
                  child: ProfileEditDoubleButtons(),
                ),
              ],
            ),
          ],
        ),
        
      ],
    );
  }
}
