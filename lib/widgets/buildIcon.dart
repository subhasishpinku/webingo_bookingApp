import 'package:flutter/material.dart';

class BuildIcon extends StatelessWidget {
  final IconData activeIcon;
  final IconData inactiveIcon;
  final int index;
  final int pageIndex;
  final Function(int) onPageSelected;

  const BuildIcon({
    Key? key,
    required this.activeIcon,
    required this.inactiveIcon,
    required this.index,
    required this.pageIndex,
    required this.onPageSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSelected = pageIndex == index;
    return GestureDetector(
      onTap: () => onPageSelected(index),
      child: Container(
        width: 75,
        height: 75,
        decoration: isSelected
            ? BoxDecoration(shape: BoxShape.circle, color: Colors.white)
            : null,
        child: Icon(
          isSelected ? activeIcon : inactiveIcon,
          color: isSelected ? Colors.black : Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
