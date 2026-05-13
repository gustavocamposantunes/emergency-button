import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../design_system/atoms/info_card.dart';
import '../../../design_system/organisms/bottom_navigation.dart';
import '../../contacts/pages/contacts_page.dart';
import '../../history/pages/history_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
            colors: [
              Color(0xFF111A20),
              AppColors.background,
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
                  color: const Color(0xFF3A1D1F).withOpacity(0.10),
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
                  color: const Color(0xFF2A1215).withOpacity(0.12),
                ),
              ),
            ),
            Positioned.fill(
              child: IgnorePointer(
                child: Opacity(
                  opacity: 0.22,
                  child: CustomPaint(
                    painter: _EmergencyGridPainter(
                      lineColor: AppColors.accent.withOpacity(0.30),
                    ),
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
                        border: Border.all(color: AppColors.line.withOpacity(0.45)),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.star_rounded, color: AppColors.textSecondary, size: 30),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Text(
                              'MODO DE EMERGÊNCIA\nATIVO',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: AppColors.textPrimary,
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
                                      color: AppColors.textSecondary,
                                      fontWeight: FontWeight.w800,
                                    ),
                              ),
                              Text(
                                'Ativo',
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      color: AppColors.textSecondary,
                                      fontWeight: FontWeight.w800,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 16),
                          const Icon(Icons.circle, color: AppColors.textSecondary, size: 12),
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
                          color: AppColors.accent,
                          border: Border.all(color: const Color(0xFFFF9A9A), width: 4),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.35),
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
                                        color: AppColors.accentDark,
                                        fontWeight: FontWeight.w900,
                                        letterSpacing: -1.5,
                                      ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  'SEGURE POR 3S',
                                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                        color: AppColors.accentDark,
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
                            color: AppColors.accentSoft,
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
                              color: AppColors.textSecondary,
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
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.line.withOpacity(0.20)),
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
                            child: const Icon(
                              Icons.location_on_outlined,
                              color: Color(0xFFD9D9E5),
                              size: 34,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sua Localização Atual',
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                        color: AppColors.textSecondary,
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
                        InfoCard(
                          icon: Icons.battery_charging_full_rounded,
                          title: 'Bateria',
                          value: '84%',
                          iconBackground: const Color(0xFF2C2F39),
                        ),
                        const SizedBox(width: 16),
                        InfoCard(
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
      bottomNavigationBar: BottomNavigation(
        activeIndex: 0,
        items: [
          BottomNavItem(icon: Icons.star, label: 'Alerta'),
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
      ..color = lineColor.withOpacity(0.20)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(Offset(size.width * 0.85, size.height * 0.82), size.width * 0.24, glowPaint);
    canvas.drawCircle(Offset(size.width * 0.22, size.height * 0.26), size.width * 0.18, glowPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
