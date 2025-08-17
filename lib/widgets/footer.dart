import 'package:flutter/material.dart';
import '../widgets/responsive.dart';

class SiteFooter extends StatelessWidget {
  const SiteFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      color: scheme.surfaceContainerHighest,
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: MaxWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 24,
              runSpacing: 12,
              children: [
                const _FooterCol(
                  title: 'Organization',
                  items: {
                    'About': '/about',
                    'Science': '/science',
                    'FAQ': '/faq',
                  },
                ),
                const _FooterCol(
                  title: 'Action',
                  items: {
                    'Get involved': '/get-involved',
                  },
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Contact', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8),
                    SelectableText('info@keepfluoride.org'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            Divider(color: scheme.outlineVariant),
            const SizedBox(height: 8),
            Text('© ${DateTime.now().year} Keep Fluoride.'),
          ],
        ),
      ),
    );
  }
}

class _FooterCol extends StatelessWidget {
  final String title;
  final Map<String, String> items;
  const _FooterCol({required this.title, required this.items});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          ...items.entries.map((e) => TextButton(
                onPressed: () => Navigator.pushNamed(context, e.value),
                child: Align(alignment: Alignment.centerLeft, child: Text(e.key)),
              )),
        ],
      ),
    );
  }
}
