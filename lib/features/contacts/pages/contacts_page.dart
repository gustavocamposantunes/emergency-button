import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../design_system/molecules/contact_card.dart';
import '../../../design_system/organisms/bottom_navigation.dart';
import '../../home/pages/home_page.dart';
import '../../history/pages/history_page.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.appBarBackground,
        elevation: 0,
        centerTitle: false,
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.shield_outlined),
          color: AppColors.accentSoft,
        ),
        title: const Text(
          'Guardian SOS',
          style: TextStyle(
            color: AppColors.accentSoft,
            fontWeight: FontWeight.w900,
            letterSpacing: -0.5,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings_outlined),
            color: AppColors.accentSoft,
          ),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 1, thickness: 1, color: AppColors.line),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.topCenter,
            radius: 1.45,
            colors: [Color(0xFF111A20), AppColors.background],
          ),
        ),
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 20),
            children: [
              Text(
                'Contatos de Emergência',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      height: 1.04,
                    ),
              ),
              const SizedBox(height: 10),
              Text(
                'Gerencie quem será notificado durante um evento de emergência.',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.textLight,
                      height: 1.35,
                    ),
              ),
              const SizedBox(height: 18),
              FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.person_add_alt_1),
                label: const Text(
                  'Adicionar Contato',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
                ),
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.accent,
                  foregroundColor: const Color(0xFF4F0508),
                  minimumSize: const Size.fromHeight(64),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              const SizedBox(height: 22),
              ContactCard(
                initials: 'JD',
                name: 'Jane Doe',
                locationEnabled: true,
                avatarColor: AppColors.avatarGray,
              ),
              const SizedBox(height: 16),
              ContactCard(
                initials: 'MS',
                name: 'Michael Smith',
                locationEnabled: false,
                avatarColor: AppColors.avatarGrayLight,
              ),
              const SizedBox(height: 16),
              ContactCard(
                initials: 'RL',
                name: 'Robert Long',
                locationEnabled: true,
                avatarColor: AppColors.avatarGrayLighter,
              ),
              const SizedBox(height: 18),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.surfaceElevated,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: AppColors.line.withOpacity(0.20)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contexto de Compartilhamento em Tempo Real',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: AppColors.accentSoft,
                            fontWeight: FontWeight.w900,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Contatos com acesso à localização podem ver sua posição em tempo real durante um alerta.',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppColors.textLight,
                            height: 1.35,
                          ),
                    ),
                    const SizedBox(height: 18),
                    Container(
                      height: 158,
                      decoration: BoxDecoration(
                        color: const Color(0xFF121214),
                        borderRadius: BorderRadius.circular(14),
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFF1A1A1D), Color(0xFF121214)],
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.location_searching_outlined,
                          color: AppColors.accentSoft.withOpacity(0.20),
                          size: 54,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        activeIndex: 1,
        items: [
          BottomNavItem(
            icon: Icons.star,
            label: 'Alerta',
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const HomePage(),
                ),
              );
            },
          ),
          BottomNavItem(icon: Icons.groups_outlined, label: 'Contatos'),
          BottomNavItem(
            icon: Icons.history,
            label: 'Histórico',
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const HistoryPage(),
                ),
              );
            },
          ),
          BottomNavItem(icon: Icons.medical_services_outlined, label: 'Médico'),
        ],
      ),
    );
  }
}
