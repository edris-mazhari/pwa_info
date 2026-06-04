import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pwa_info/pwa_info.dart';

void main() {
  runApp(const PwaInfoApp());
}

class PwaInfoApp extends StatelessWidget {
  const PwaInfoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PWA Info',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      home: const InfoScreen(),
    );
  }
}

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb) {
      return Scaffold(
        appBar: AppBar(title: const Text('PWA Info')),
        body: const Center(
          child: Text('This example must run on the web platform.'),
        ),
      );
    }

    final info = PwaInfo();
    final result = info.all;

    return Scaffold(
      appBar: AppBar(title: const Text('PWA Info')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _InfoCard(title: 'Operating System', value: result.os.name),
          _InfoCard(title: 'Browser', value: result.browser.name),
          _InfoCard(title: 'Is Mobile', value: result.isMobile.toString()),
          _InfoCard(
            title: 'Is Standalone PWA',
            value: result.isStandalone.toString(),
          ),
          _InfoCard(title: 'User Agent', value: result.userAgent),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final String value;

  const _InfoCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const SizedBox(height: 4),
            SelectableText(value),
          ],
        ),
      ),
    );
  }
}
