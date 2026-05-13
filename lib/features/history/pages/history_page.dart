import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../design_system/molecules/history_card.dart';
import '../../../design_system/organisms/bottom_navigation.dart';
import '../../contacts/pages/contacts_page.dart';
import '../../home/pages/home_page.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

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
                      color: AppColors.textLight,
                      height: 1.35,
                    ),
              ),
              const SizedBox(height: 22),
              HistoryCard(
                monthDay: '24 OUT, 2023',
                time: '14:32:05',
                status: 'Resolvido',
                statusColor: const Color(0xFF96A2C8),
                zoneTitle: 'Ver no mapa',
                zoneSubtitle:
                    '4512 West Industrial Ave, Suite 300\nO beacon de emergência ficou ativo por 14 minutos.',
              ),
              const SizedBox(height: 18),
              HistoryCard(
                monthDay: '21 OUT, 2023',
                time: '09:15:44',
                status: 'Falso Alarme',
                statusColor: const Color(0xFFC59A91),
                zoneTitle: 'Ver no mapa',
                zoneSubtitle:
                    '812 Hill Street, Centro\nDisparo cancelado antes da notificação ser concluída.',
              ),
              const SizedBox(height: 18),
              HistoryCard(
                monthDay: '15 SET, 2023',
                time: '22:01:12',
                status: 'Resolvido',
                statusColor: const Color(0xFF96A2C8),
                zoneTitle: 'Ver no mapa',
                zoneSubtitle:
                    '1149 Riverside Dr, Bloco C\nEquipe de apoio encerrou o alerta com sucesso.',
              ),
              const SizedBox(height: 18),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.surfaceElevated,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: AppColors.line.withOpacity(0.35)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Última Zona do Alerta',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: AppColors.accentSoft,
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
                        border: Border.all(color: AppColors.line.withOpacity(0.25)),
                      ),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Opacity(
                              opacity: 0.28,
                              child: CustomPaint(
                                painter: _HistoryMapPainter(
                                  lineColor: AppColors.accentSoft.withOpacity(0.22),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 18,
                            top: 18,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                color: AppColors.accentSoft,
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
      bottomNavigationBar: BottomNavigation(
        activeIndex: 2,
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
          BottomNavItem(
            icon: Icons.groups_outlined,
            label: 'Contatos',
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const ContactsPage(),
                ),
              );
            },
          ),
          BottomNavItem(icon: Icons.history, label: 'Histórico'),
          BottomNavItem(icon: Icons.medical_services_outlined, label: 'Médico'),
        ],
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
      ..color = AppColors.accent.withOpacity(0.70)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(size.width * 0.53, size.height * 0.45), 12, markerPaint);
    canvas.drawCircle(Offset(size.width * 0.58, size.height * 0.50), 10, markerPaint);
    canvas.drawCircle(Offset(size.width * 0.78, size.height * 0.18), 7, markerPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
