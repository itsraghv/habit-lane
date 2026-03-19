import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mensurge/theme/app_theme.dart';
import 'package:mensurge/features/onboarding/onboarding_screen.dart';

void main() {
  runApp(const ProviderScope(child: MensurgeApp()));
}

class MensurgeApp extends StatelessWidget {
  const MensurgeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mensurge',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const OnboardingScreen(),
    );
  }
}
