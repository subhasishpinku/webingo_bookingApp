import 'package:flutter/material.dart';
import 'package:test_webingo/widgets/buildIcon.dart';

class BottomBar extends StatelessWidget {
  final int pageIndex;
  final Function(int) onPageSelected;

  const BottomBar({
    Key? key,
    required this.pageIndex,
    required this.onPageSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, bottom: 25),
      child: Container(
        height: 80,
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BuildIcon(
              activeIcon: Icons.home_filled,
              inactiveIcon: Icons.home_outlined,
              index: 0,
              pageIndex: pageIndex,
              onPageSelected: onPageSelected,
            ),
            BuildIcon(
              activeIcon: Icons.widgets_outlined,
              inactiveIcon: Icons.widgets_outlined,
              index: 1,
              pageIndex: pageIndex,
              onPageSelected: onPageSelected,
            ),
            BuildIcon(
              activeIcon: Icons.bar_chart,
              inactiveIcon: Icons.insert_chart,
              index: 2,
              pageIndex: pageIndex,
              onPageSelected: onPageSelected,
            ),
            BuildIcon(
              activeIcon: Icons.person,
              inactiveIcon: Icons.person_outline,
              index: 3,
              pageIndex: pageIndex,
              onPageSelected: onPageSelected,
            ),
          ],
        ),
      ),
    );
  }
}
