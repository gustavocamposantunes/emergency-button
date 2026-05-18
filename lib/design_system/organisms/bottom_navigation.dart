import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../atoms/nav_item.dart';

class BottomNavigation extends StatelessWidget {
  final int activeIndex;
  final List<BottomNavItem> items;
  final Function(int)? onItemTapped;

  const BottomNavigation({
    required this.activeIndex,
    required this.items,
    this.onItemTapped,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF111113),
        border: Border(
          top: BorderSide(
            color: AppColors.line.withValues(alpha: 0.55),
          ),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(14, 16, 14, 18),
      child: Row(
        children: List.generate(
          items.length,
          (index) => NavItem(
            icon: items[index].icon,
            label: items[index].label,
            isActive: activeIndex == index,
            onTap: () {
              onItemTapped?.call(index);
              items[index].onTap?.call();
            },
          ),
        ),
      ),
    );
  }
}

class BottomNavItem {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  BottomNavItem({
    required this.icon,
    required this.label,
    this.onTap,
  });
}
