import 'package:flutter/material.dart';
import 'responsive.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [scheme.primaryContainer, scheme.surface],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: MaxWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Keep Fluoride in Our Water', style: Theme.of(context).textTheme.displayMedium),
            const SizedBox(height: 12),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 760),
              child: Text(
                'Practical, peer-reviewed science supports community water fluoridation as a safe, cost-effective public health measure.',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                FilledButton(
                  onPressed: () => Navigator.pushNamed(context, '/get-involved'),
                  child: const Text('Join the coalition'),
                ),
                OutlinedButton(
                  onPressed: () => Navigator.pushNamed(context, '/science'),
                  child: const Text('See the evidence'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ThreeUpGrid extends StatelessWidget {
  final List<CardItem> items;
  const ThreeUpGrid({super.key, required this.items});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final cross = width >= 1200 ? 3 : width >= 700 ? 2 : 1;
    return MaxWidth(
      child: GridView.count(
        crossAxisCount: cross,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: items
            .map((i) => Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(i.icon, size: 32),
                        const SizedBox(height: 12),
                        Text(i.title, style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(height: 8),
                        Text(i.body),
                      ],
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}

class CardItem {
  final IconData icon;
  final String title;
  final String body;
  CardItem(this.icon, this.title, this.body);
}

class CtaBanner extends StatelessWidget {
  final String title;
  final String buttonText;
  final VoidCallback onPressed;
  const CtaBanner({super.key, required this.title, required this.buttonText, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 32),
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 16),
      color: scheme.primaryContainer,
      child: MaxWidth(
        child: Row(
          children: [
            Expanded(child: Text(title, style: Theme.of(context).textTheme.headlineMedium)),
            const SizedBox(width: 12),
            FilledButton(onPressed: onPressed, child: Text(buttonText)),
          ],
        ),
      ),
    );
  }
}
