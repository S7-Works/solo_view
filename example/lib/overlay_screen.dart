import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solo_view/solo_view.dart';

final isShowMenuStateProvider = StateProvider<bool>((ref) => false);

class OverlayPage extends HookConsumerWidget {
  const OverlayPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showMenu = ref.watch(isShowMenuStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Solo View"),
      ),
      body: Column(
        children: [
          SoloViewBarrier(
            visibility: showMenu,
            follower: Alignment.topLeft,
            target: Alignment.bottomLeft,
            items: const [],
            onClose: () =>
                ref.read(isShowMenuStateProvider.notifier).state = false,
            childItem: TextButton(
              onPressed: () {
                ref.read(isShowMenuStateProvider.notifier).state = !showMenu;
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(16.0),
                backgroundColor: Colors.blue,
                elevation: 9.0,
                textStyle: const TextStyle(
                  fontSize: 20,
                ),
              ),
              child: const Text("Click Me"),
            ),

            // CustomButton(
            //   onPressed: () {},
            //   child: const Text("Click me"),
            // ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () {
              ref.read(isShowMenuStateProvider.notifier).state = !showMenu;
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              padding: const EdgeInsets.all(16.0),
              backgroundColor: Colors.blue,
              elevation: 9.0,
              textStyle: const TextStyle(
                fontSize: 20,
              ),
            ),
            child: const Text("No Barrier "),
          ),
        ],
      ),
    );
  }
}
