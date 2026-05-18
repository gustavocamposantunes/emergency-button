import 'package:flutter/material.dart';

import '../contacts/contacts_page.dart';
import '../home/home_page.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

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

  Widget _buildStatusPill({required String label, required Color background, required Color dotColor}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: _line.withValues(alpha: 0.30)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(width: 10, height: 10, decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle)),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFFD8DCE7),
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryCard({
    required BuildContext context,
    required String monthDay,
    required String time,
    required String status,
    required Color statusColor,
    required String zoneTitle,
    required String zoneSubtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: _surfaceElevated,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _line.withValues(alpha: 0.35)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    monthDay,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: _accentSoft,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 0.3,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    time,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ],
              ),
              const Spacer(),
              _buildStatusPill(
                label: status,
                background: statusColor.withValues(alpha: 0.18),
                dotColor: statusColor,
              ),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.map_outlined, size: 26),
                  label: const Text(
                    'Ver no mapa',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xFF38383B),
                    side: BorderSide(color: _line.withValues(alpha: 0.50), width: 1.5),
                    minimumSize: const Size.fromHeight(64),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
              const SizedBox(width: 18),
              Container(
                width: 68,
                height: 68,
                decoration: BoxDecoration(
                  color: const Color(0xFF2B2B2E),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: _line.withValues(alpha: 0.35)),
                ),
                child: const Icon(Icons.more_vert_rounded, color: _accentSoft, size: 34),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Container(
            height: 188,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF122338), Color(0xFF1A1D24)],
              ),
              border: Border.all(color: _line.withValues(alpha: 0.25)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.15),
                  blurRadius: 18,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Opacity(
                    opacity: 0.24,
                    child: CustomPaint(
                      painter: _HistoryMapPainter(lineColor: _accentSoft.withValues(alpha: 0.24)),
                    ),
                  ),
                ),
                Positioned(
                  left: 18,
                  top: 18,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFB4B4),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      zoneTitle,
                      style: const TextStyle(
                        color: Color(0xFF4F0508),
                        fontSize: 15,
                        letterSpacing: 0.3,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 18,
                  right: 18,
                  bottom: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        zoneSubtitle,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: const Color(0xFFE7D3D3),
                              height: 1.2,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
                'Histórico de Alertas',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      height: 1.04,
                    ),
              ),
              const SizedBox(height: 10),
              Text(
                'Registros detalhados das suas ativações de emergência recentes.',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: const Color(0xFFE4C2C2),
                      height: 1.35,
                    ),
              ),
              const SizedBox(height: 22),
              _buildHistoryCard(
                context: context,
                monthDay: '24 OUT, 2023',
                time: '14:32:05',
                status: 'Resolvido',
                statusColor: const Color(0xFF96A2C8),
                zoneTitle: 'Ver no mapa',
                zoneSubtitle: '4512 West Industrial Ave, Suite 300\nO beacon de emergência ficou ativo por 14 minutos.',
              ),
              const SizedBox(height: 18),
              _buildHistoryCard(
                context: context,
                monthDay: '21 OUT, 2023',
                time: '09:15:44',
                status: 'Falso Alarme',
                statusColor: const Color(0xFFC59A91),
                zoneTitle: 'Ver no mapa',
                zoneSubtitle: '812 Hill Street, Centro\nDisparo cancelado antes da notificação ser concluída.',
              ),
              const SizedBox(height: 18),
              _buildHistoryCard(
                context: context,
                monthDay: '15 SET, 2023',
                time: '22:01:12',
                status: 'Resolvido',
                statusColor: const Color(0xFF96A2C8),
                zoneTitle: 'Ver no mapa',
                zoneSubtitle: '1149 Riverside Dr, Bloco C\nEquipe de apoio encerrou o alerta com sucesso.',
              ),
              const SizedBox(height: 18),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: _surfaceElevated,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: _line.withValues(alpha: 0.35)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Última Zona do Alerta',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: _accentSoft,
                            fontWeight: FontWeight.w900,
                          ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 220,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFF101A25), Color(0xFF1D1A1A)],
                        ),
                        border: Border.all(color: _line.withValues(alpha: 0.25)),
                      ),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Opacity(
                              opacity: 0.28,
                              child: CustomPaint(
                                painter: _HistoryMapPainter(lineColor: _accentSoft.withValues(alpha: 0.22)),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 18,
                            top: 18,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFB4B4),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Text(
                                'ÚLTIMA ZONA DO ALERTA',
                                style: TextStyle(
                                  color: Color(0xFF4F0508),
                                  fontSize: 15,
                                  letterSpacing: 0.3,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 18,
                            right: 18,
                            bottom: 16,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '4512 West Industrial Ave, Suite 300',
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                        color: const Color(0xFFE7D3D3),
                                      ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  'O beacon de emergência ficou ativo por 14 minutos.',
                                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        height: 1.2,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
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
              onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute<void>(builder: (BuildContext context) => const HomePage()),
              ),
            ),
            _buildBottomNavItem(
              icon: Icons.groups_outlined,
              label: 'Contatos',
              onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute<void>(builder: (BuildContext context) => const ContactsPage()),
              ),
            ),
            _buildBottomNavItem(icon: Icons.history, label: 'Histórico', active: true),
            _buildBottomNavItem(icon: Icons.medical_services_outlined, label: 'Médico'),
          ],
        ),
      ),
    );
  }
}

class _HistoryMapPainter extends CustomPainter {
  _HistoryMapPainter({required this.lineColor});

  final Color lineColor;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = lineColor
      ..strokeWidth = 1.1
      ..style = PaintingStyle.stroke;

    const double step = 26;
    for (double x = -size.height; x < size.width + size.height; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x + size.height, size.height), paint);
    }

    final Paint markerPaint = Paint()
      ..color = const Color(0xFFE53E3E).withValues(alpha: 0.70)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(size.width * 0.53, size.height * 0.45), 12, markerPaint);
    canvas.drawCircle(Offset(size.width * 0.58, size.height * 0.50), 10, markerPaint);
    canvas.drawCircle(Offset(size.width * 0.78, size.height * 0.18), 7, markerPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

}
