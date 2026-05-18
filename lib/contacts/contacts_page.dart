import 'package:flutter/material.dart';

import '../history/history_page.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  static const Color _background = Color(0xFF0A0B0D);
  static const Color _surfaceElevated = Color(0xFF242428);
  static const Color _accent = Color(0xFFE53E3E);
  static const Color _accentSoft = Color(0xFFFFB4B4);
  static const Color _line = Color(0xFF7A4848);

  Widget _buildBottomNavItem({
    required IconData icon,
    required String label,
    bool active = false,
    VoidCallback? onTap,
  }) {
    final Color foreground = active ? Colors.black : _accentSoft;
    final Color background = active ? _accent : Colors.transparent;

    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              decoration: BoxDecoration(
                color: background,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Icon(icon, color: foreground, size: 28),
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: const TextStyle(
                color: _accentSoft,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBadge(String label, {bool enabled = true}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: enabled ? const Color(0xFF3A3A3D) : const Color(0xFF17171A),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: enabled ? Colors.transparent : _line.withValues(alpha: 0.15)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              enabled ? Icons.chat_bubble_outline : Icons.location_off_outlined,
              color: enabled ? _accentSoft : const Color(0xFF5E5E66),
              size: 18,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: enabled ? Colors.white : const Color(0xFF5E5E66),
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactCard({
    required BuildContext context,
    required String initials,
    required String name,
    required bool locationEnabled,
    required Color avatarColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _surfaceElevated,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: _line.withValues(alpha: 0.20)),
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
                          onPressed: () {},
                          icon: const Icon(Icons.edit_outlined),
                          color: _accentSoft,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.delete_outline),
                          color: _accentSoft,
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Gerencie quem será notificado durante um evento de emergência.',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: const Color(0xFFE4C2C2),
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
              _buildBadge('Alerta SMS'),
              const SizedBox(width: 10),
              _buildBadge('Localização', enabled: locationEnabled),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _background,
      appBar: AppBar(
        backgroundColor: const Color(0xFF232325),
        elevation: 0,
        centerTitle: false,
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.shield_outlined),
          color: _accentSoft,
        ),
        title: const Text(
          'Guardian SOS',
          style: TextStyle(
            color: _accentSoft,
            fontWeight: FontWeight.w900,
            letterSpacing: -0.5,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings_outlined),
            color: _accentSoft,
          ),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 1, thickness: 1, color: _line),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.topCenter,
            radius: 1.45,
            colors: [Color(0xFF111A20), _background],
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
                      color: const Color(0xFFE4C2C2),
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
                  backgroundColor: _accent,
                  foregroundColor: const Color(0xFF4F0508),
                  minimumSize: const Size.fromHeight(64),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
              ),
              const SizedBox(height: 22),
              _buildContactCard(
                context: context,
                initials: 'JD',
                name: 'Jane Doe',
                locationEnabled: true,
                avatarColor: const Color(0xFF626A7A),
              ),
              const SizedBox(height: 16),
              _buildContactCard(
                context: context,
                initials: 'MS',
                name: 'Michael Smith',
                locationEnabled: false,
                avatarColor: const Color(0xFF8792A8),
              ),
              const SizedBox(height: 16),
              _buildContactCard(
                context: context,
                initials: 'RL',
                name: 'Robert Long',
                locationEnabled: true,
                avatarColor: const Color(0xFFC8CFDF),
              ),
              const SizedBox(height: 18),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: _surfaceElevated,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: _line.withValues(alpha: 0.20)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contexto de Compartilhamento em Tempo Real',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: _accentSoft,
                            fontWeight: FontWeight.w900,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Contatos com acesso à localização podem ver sua posição em tempo real durante um alerta.',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: const Color(0xFFE4C2C2),
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
                          color: _accentSoft.withValues(alpha: 0.20),
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
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF111113),
          border: Border(top: BorderSide(color: _line.withValues(alpha: 0.55))),
        ),
        padding: const EdgeInsets.fromLTRB(14, 16, 14, 18),
        child: Row(
          children: [
            _buildBottomNavItem(
              icon: Icons.star,
              label: 'Alerta',
              onTap: () => Navigator.of(context).pop(),
            ),
            _buildBottomNavItem(icon: Icons.groups_outlined, label: 'Contatos', active: true),
            _buildBottomNavItem(
              icon: Icons.history,
              label: 'Histórico',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const HistoryPage(),
                  ),
                );
              },
            ),
            _buildBottomNavItem(icon: Icons.medical_services_outlined, label: 'Médico'),
          ],
        ),
      ),
    );
  }
}