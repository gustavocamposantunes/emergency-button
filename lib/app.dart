import 'package:flutter/material.dart';

import 'features/home/pages/home_page.dart';
import 'features/skycast/skycast_page.dart';

class EmergencyButtonApp extends StatelessWidget {
  const EmergencyButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Guardian SOS',
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: const Color(0xFFE53E3E),
          secondary: const Color(0xFF1A202C),
          tertiary: const Color(0xFF2D3748),
          surface: const Color(0xFFFAFAFA),
          onPrimary: const Color(0xFFFFFFFF),
          onSecondary: const Color(0xFFFFFFFF),
          onTertiary: const Color(0xFFFFFFFF),
          onSurface: const Color(0xFF0A0B0D),
        ),
        useMaterial3: true,
      ),
      home: const SkyCastPage(),
    );
  }
}