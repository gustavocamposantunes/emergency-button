import 'package:flutter/material.dart';

import '../contacts/contacts_page.dart';
import '../history/history_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const Color _background = Color(0xFF0A0B0D);
  static const Color _surface = Color(0xFF1A1A1D);
  static const Color _surfaceElevated = Color(0xFF242428);
  static const Color _accent = Color(0xFFE53E3E);
  static const Color _accentSoft = Color(0xFFFFB4B4);
  static const Color _line = Color(0xFF7A4848);
  static const Color _textPrimary = Color(0xFFF6C6C6);
  static const Color _textSecondary = Color(0xFFD7B2B2);

  Widget _buildInfoCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String value,
    required Color iconBackground,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: _surfaceElevated,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: _line.withValues(alpha: 0.25)),
        ),
        child: Row(
          children: [
            Container(
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                color: iconBackground,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: _accentSoft, size: 30),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: _textSecondary,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    value,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

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
            colors: [
              Color(0xFF111A20),
              _background,
            ],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              right: -40,
              top: 180,
              child: Container(
                width: 240,
                height: 240,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF3A1D1F).withValues(alpha: 0.10),
                ),
              ),
            ),
            Positioned(
              left: -60,
              bottom: 220,
              child: Container(
                width: 220,
                height: 220,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF2A1215).withValues(alpha: 0.12),
                ),
              ),
            ),
            Positioned.fill(
              child: IgnorePointer(
                child: Opacity(
                  opacity: 0.22,
                  child: CustomPaint(
                    painter: _EmergencyGridPainter(lineColor: _accent.withValues(alpha: 0.30)),
                  ),
                ),
              ),
            ),
            SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Column(
                  children: [
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF24161B),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: _line.withValues(alpha: 0.45)),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.star_rounded, color: _textSecondary, size: 30),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Text(
                              'MODO DE EMERGÊNCIA\nATIVO',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: _textPrimary,
                                    fontWeight: FontWeight.w900,
                                    height: 1.02,
                                  ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'GPS:',
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      color: _textSecondary,
                                      fontWeight: FontWeight.w800,
                                    ),
                              ),
                              Text(
                                'Ativo',
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      color: _textSecondary,
                                      fontWeight: FontWeight.w800,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 16),
                          const Icon(Icons.circle, color: _textSecondary, size: 12),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    Center(
                      child: Container(
                        width: 446,
                        height: 446,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _accent,
                          border: Border.all(color: const Color(0xFFFF9A9A), width: 4),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.35),
                              blurRadius: 28,
                              spreadRadius: 10,
                            ),
                          ],
                        ),
                        child: Material(
                          color: Colors.transparent,
                          shape: const CircleBorder(),
                          child: InkWell(
                            customBorder: const CircleBorder(),
                            onLongPress: () {},
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'SOS',
                                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                                        color: const Color(0xFF62070B),
                                        fontWeight: FontWeight.w900,
                                        letterSpacing: -1.5,
                                      ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  'SEGURE POR 3S',
                                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                        color: const Color(0xFF62070B),
                                        fontWeight: FontWeight.w800,
                                        letterSpacing: 1.2,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Text(
                      'Enviando alerta em 3s...',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: _accentSoft,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -0.5,
                          ),
                    ),
                    const SizedBox(height: 14),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 380),
                      child: Text(
                        'As autoridades e contatos de emergência serão notificados com sua localização.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: _textSecondary,
                              height: 1.35,
                            ),
                      ),
                    ),
                    const SizedBox(height: 44),
                    SizedBox(
                      width: 320,
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.close, size: 28),
                        label: const Text(
                          'CANCELAR ALERTA',
                          style: TextStyle(fontWeight: FontWeight.w900),
                        ),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: const Color(0xFF2D2D31),
                          side: const BorderSide(color: Color(0xFF7A5757), width: 2),
                          minimumSize: const Size.fromHeight(66),
                          textStyle: const TextStyle(fontSize: 17),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 56),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: _surface,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: _line.withValues(alpha: 0.20)),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 68,
                            height: 68,
                            decoration: BoxDecoration(
                              color: const Color(0xFF51596C),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: const Icon(Icons.location_on_outlined, color: Color(0xFFD9D9E5), size: 34),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sua Localização Atual',
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                        color: _textSecondary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  '123 Emergency St, Metro City',
                                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        _buildInfoCard(
                          context: context,
                          icon: Icons.battery_charging_full_rounded,
                          title: 'Bateria',
                          value: '84%',
                          iconBackground: const Color(0xFF2C2F39),
                        ),
                        const SizedBox(width: 16),
                        _buildInfoCard(
                          context: context,
                          icon: Icons.signal_cellular_alt_rounded,
                          title: 'Sinal',
                          value: 'Forte',
                          iconBackground: const Color(0xFF2C2F39),
                        ),
                      ],
                    ),
                    const SizedBox(height: 22),
                  ],
                ),
              ),
            ),
          ],
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
            _buildBottomNavItem(icon: Icons.star, label: 'Alerta', active: true),
            _buildBottomNavItem(
              icon: Icons.groups_outlined,
              label: 'Contatos',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const ContactsPage(),
                  ),
                );
              },
            ),
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

class _EmergencyGridPainter extends CustomPainter {
  _EmergencyGridPainter({required this.lineColor});

  final Color lineColor;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = lineColor
      ..strokeWidth = 1.2
      ..style = PaintingStyle.stroke;

    const double step = 28;
    for (double x = -size.height; x < size.width + size.height; x += step) {
      canvas.drawLine(Offset(x, size.height), Offset(x + size.height, 0), paint);
    }

    final Paint glowPaint = Paint()
      ..color = lineColor.withValues(alpha: 0.20)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(Offset(size.width * 0.85, size.height * 0.82), size.width * 0.24, glowPaint);
    canvas.drawCircle(Offset(size.width * 0.22, size.height * 0.26), size.width * 0.18, glowPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}