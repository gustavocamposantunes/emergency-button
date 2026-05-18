import 'dart:async';

import 'package:flutter/material.dart';

import '../home/pages/home_page.dart';

class SkyCastPage extends StatefulWidget {
  const SkyCastPage({super.key});

  @override
  State<SkyCastPage> createState() => _SkyCastPageState();
}

class _SkyCastPageState extends State<SkyCastPage> {
  static const Color _background = Color(0xFF0A0B0D);
  static const Color _surfaceElevated = Color(0xFF242428);
  static const Color _accentSoft = Color(0xFFFFB4B4);
  static const Color _accentPeach = Color(0xFFE8A89C);
  static const Color _line = Color(0xFF7A4848);

  Timer? _holdTimer;

  void _startHoldTimer() {
    _holdTimer?.cancel();
    _holdTimer = Timer(const Duration(seconds: 5), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute<void>(builder: (BuildContext context) => const HomePage()),
      );
    });
  }

  void _cancelHoldTimer() {
    _holdTimer?.cancel();
    _holdTimer = null;
  }

  @override
  void dispose() {
    _cancelHoldTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _background,
      appBar: AppBar(
        backgroundColor: _background,
        elevation: 0,
        centerTitle: false,
        titleSpacing: 16,
        title: Row(
          children: [
            Icon(Icons.cloud, color: _accentPeach, size: 28),
            const SizedBox(width: 8),
            const Text(
              'SkyCast',
              style: TextStyle(
                color: _accentPeach,
                fontSize: 24,
                fontWeight: FontWeight.w900,
                letterSpacing: -0.5,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            color: _accentPeach,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
            color: _accentPeach,
          ),
        ],
      ),
      body: GestureDetector(
        onTapDown: (_) => _startHoldTimer(),
        onTapUp: (_) => _cancelHoldTimer(),
        onTapCancel: () => _cancelHoldTimer(),
        behavior: HitTestBehavior.opaque,
        child: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.topCenter,
              radius: 1.45,
              colors: [Color(0xFF111A20), _background],
            ),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Seção Principal de Clima
                GestureDetector(
                  onTap: () {}, // Evita propagação do tap
                  child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: _surfaceElevated,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: _line.withValues(alpha: 0.15)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'São Paulo',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '24°C',
                            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 72,
                                ),
                          ),
                          const SizedBox(width: 16),
                          Icon(
                            Icons.cloud,
                            color: _accentPeach,
                            size: 64,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Parcialmente Nublado',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Icon(Icons.opacity, color: _accentPeach, size: 32),
                                const SizedBox(height: 8),
                                Text(
                                  'Umidade',
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                        color: _accentSoft,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '65%',
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Icon(Icons.air, color: _accentPeach, size: 32),
                                const SizedBox(height: 8),
                                Text(
                                  'Vento',
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                        color: _accentSoft,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '12 km/h',
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ),
                const SizedBox(height: 20),

                // Cards UV Index e Sensação Térmica
                GestureDetector(
                  onTap: () {}, // Evita propagação do tap
                  child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: _surfaceElevated,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(color: _line.withValues(alpha: 0.15)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Índice UV',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: _accentSoft,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '3 Baixo',
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                  ),
                            ),
                            const SizedBox(height: 12),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: LinearProgressIndicator(
                                value: 0.3,
                                minHeight: 6,
                                backgroundColor: _surfaceElevated,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  _accentPeach.withValues(alpha: 0.6),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: _surfaceElevated,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(color: _line.withValues(alpha: 0.15)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sensação Térmica',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: _accentSoft,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '26°C',
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                  ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'Umidade deixa mais quente.',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: const Color(0xFFE4C2C2),
                                    height: 1.3,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                ),
                const SizedBox(height: 24),

                // Previsão de 5 dias
                GestureDetector(
                  onTap: () {}, // Evita propagação do tap
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Previsão 5 Dias',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                            ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        decoration: BoxDecoration(
                          color: _surfaceElevated,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(color: _line.withValues(alpha: 0.15)),
                        ),
                        child: Column(
                          children: [
                            _buildForecastDay('Hoje', '☁', '24°', '18°'),
                            Divider(height: 1, color: _line.withValues(alpha: 0.15)),
                            _buildForecastDay('Ter', '☀', '28°', '20°'),
                            Divider(height: 1, color: _line.withValues(alpha: 0.15)),
                            _buildForecastDay('Qua', '☁', '22°', '16°'),
                            Divider(height: 1, color: _line.withValues(alpha: 0.15)),
                            _buildForecastDay('Qui', '⛅', '25°', '19°'),
                            Divider(height: 1, color: _line.withValues(alpha: 0.15)),
                            _buildForecastDay('Sex', '☀', '27°', '21°', isLast: true),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Qualidade do Ar
                GestureDetector(
                  onTap: () {}, // Evita propagação do tap
                  child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: _surfaceElevated,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: _line.withValues(alpha: 0.15)),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Índice de Qualidade do Ar',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: _accentSoft,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '42 - Bom',
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFF4CAF50),
                            width: 3,
                          ),
                        ),
                        child: const Icon(
                          Icons.check,
                          color: Color(0xFF4CAF50),
                          size: 32,
                        ),
                      ),
                    ],
                  ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForecastDay(
    String day,
    String icon,
    String maxTemp,
    String minTemp, {
    bool isLast = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          SizedBox(
            width: 50,
            child: Text(
              day,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Text(
            icon,
            style: const TextStyle(fontSize: 24),
          ),
          const Spacer(),
          Text(
            maxTemp,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            minTemp,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.6),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
