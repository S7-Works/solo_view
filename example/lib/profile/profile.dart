import 'package:example/profile/profile_widgets/profile_body.dart';
import 'package:example/utils%20/constant/colors.dart';
import 'package:example/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class GroupProfilePage extends StatelessWidget {
  const GroupProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: const SingleChildScrollView(
        child: ProfileSectionBody(),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 5,
      leading: const BackButtonWidget(
        backgroundColor: buttonColor,
        foregroundColor: whiteMain,
      ),
      centerTitle: true,
      actions: [
        Transform.scale(
          scale: 0.7,
          child: Material(
              clipBehavior: Clip.antiAlias,
              color: buttonColor,
              shape: const BeveledRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    15.0,
                  ),
                  bottomRight: Radius.circular(
                    15.0,
                  ),
                ),
              ),
              child: IconButton(
                color: whiteMain,
                onPressed: () {},
                icon: const Icon(
                  MdiIcons.pencil,
                ),
              )),
        ),
      ],
    );
  }
}
