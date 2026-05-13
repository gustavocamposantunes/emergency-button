import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../atoms/badge.dart';

class ContactCard extends StatelessWidget {
  final String initials;
  final String name;
  final bool locationEnabled;
  final Color avatarColor;
  final VoidCallback? onEditTap;
  final VoidCallback? onDeleteTap;

  const ContactCard({
    required this.initials,
    required this.name,
    required this.locationEnabled,
    required this.avatarColor,
    this.onEditTap,
    this.onDeleteTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.line.withOpacity(0.20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: avatarColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Text(
                  initials,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: const Color(0xFF0D0D0F),
                        fontWeight: FontWeight.w900,
                      ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            name,
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                ),
                          ),
                        ),
                        IconButton(
                          onPressed: onEditTap,
                          icon: const Icon(Icons.edit_outlined),
                          color: AppColors.accentSoft,
                        ),
                        IconButton(
                          onPressed: onDeleteTap,
                          icon: const Icon(Icons.delete_outline),
                          color: AppColors.accentSoft,
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Gerencie quem será notificado durante um evento de emergência.',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppColors.textLight,
                            height: 1.3,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              AppBadge(label: 'Alerta SMS'),
              const SizedBox(width: 10),
              AppBadge(
                label: 'Localização',
                enabled: locationEnabled,
                icon: locationEnabled ? Icons.chat_bubble_outline : Icons.location_off_outlined,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
