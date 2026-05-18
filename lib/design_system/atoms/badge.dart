import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class AppBadge extends StatelessWidget {
  final String label;
  final bool enabled;
  final IconData? icon;

  const AppBadge({
    required this.label,
    this.enabled = true,
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: enabled ? const Color(0xFF3A3A3D) : AppColors.disabledBackground,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: enabled ? Colors.transparent : AppColors.line.withValues(alpha: 0.15),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon ?? Icons.chat_bubble_outline,
              color: enabled ? AppColors.accentSoft : AppColors.disabledText,
              size: 18,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: enabled ? Colors.white : AppColors.disabledText,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
