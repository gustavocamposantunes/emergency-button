import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../atoms/status_pill.dart';

class HistoryCard extends StatelessWidget {
  final String monthDay;
  final String time;
  final String status;
  final Color statusColor;
  final String zoneTitle;
  final String zoneSubtitle;
  final VoidCallback? onMapTap;
  final VoidCallback? onMoreTap;

  const HistoryCard({
    required this.monthDay,
    required this.time,
    required this.status,
    required this.statusColor,
    required this.zoneTitle,
    required this.zoneSubtitle,
    this.onMapTap,
    this.onMoreTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.line.withOpacity(0.35)),
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
                          color: AppColors.accentSoft,
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
              StatusPill(
                label: status,
                backgroundColor: statusColor.withOpacity(0.18),
                dotColor: statusColor,
              ),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: onMapTap,
                  icon: const Icon(Icons.map_outlined, size: 26),
                  label: const Text(
                    'Ver no mapa',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xFF38383B),
                    side: BorderSide(
                      color: AppColors.line.withOpacity(0.50),
                      width: 1.5,
                    ),
                    minimumSize: const Size.fromHeight(64),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
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
                  border: Border.all(color: AppColors.line.withOpacity(0.35)),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: onMoreTap,
                    child: const Icon(
                      Icons.more_vert_rounded,
                      color: AppColors.accentSoft,
                      size: 34,
                    ),
                  ),
                ),
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
              border: Border.all(color: AppColors.line.withOpacity(0.25)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
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
                      painter: _HistoryMapPainter(
                        lineColor: AppColors.accentSoft.withOpacity(0.24),
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
