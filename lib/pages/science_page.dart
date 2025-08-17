// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:dentalweb/widgets/nav_bar.dart';
import 'package:dentalweb/widgets/footer.dart';
import 'package:dentalweb/widgets/responsive.dart';

class SciencePage extends StatelessWidget {
  const SciencePage({super.key});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const NavBar(),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 16),
            child: MaxWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('The Science', style: text.displaySmall),
                  const SizedBox(height: 12),
                  Text(
                    'Community water fluoridation adds a small, optimal amount of fluoride to public water to prevent tooth decay. '
                    'Major health and dental organizations endorse it based on decades of peer-reviewed research. '
                    'Key points below are summarized for public understanding.',
                    style: text.titleMedium,
                  ),
                  const SizedBox(height: 24),
                  const _Bullet('Effectiveness',
                      'Population studies consistently find lower rates of cavities in fluoridated communities compared with non-fluoridated ones.'),
                  const _Bullet('Equity',
                      'Benefits reach everyone using public water, including families with limited access to dental care.'),
                  const _Bullet('Safety',
                      'Utilities target ~0.7 mg/L. Regulatory monitoring keeps levels within recommended limits.'),
                  _Bullet('Cost-benefit',
                      'Municipal programs typically save multiples of their cost in avoided treatment.'),
                  const SizedBox(height: 24),
                  Text('References', style: text.titleLarge),
                  const SizedBox(height: 8),
                  const SelectableText(
                      'Add your local health department and national public health references here. Replace placeholders with citations your organization uses.'),
                ],
              ),
            ),
          ),
          const SiteFooter(),
        ],
      ),
    );
  }
}

class _Bullet extends StatelessWidget {
  final String title;
  final String body;
  const _Bullet(this.title, this.body);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.check_circle_outline),
      title: Text(title, style: Theme.of(context).textTheme.titleLarge),
      subtitle: Text(body),
      contentPadding: EdgeInsets.zero,
      dense: false,
    );
  }
}
