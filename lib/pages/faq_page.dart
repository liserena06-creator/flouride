import 'package:flutter/material.dart';
import 'package:dentalweb/widgets/nav_bar.dart';
import 'package:dentalweb/widgets/footer.dart';
import 'package:dentalweb/widgets/responsive.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({super.key});

  @override
  Widget build(BuildContext context) {
    final faqs = <(String, String)>[
      (
        'Is fluoride the same as fluorine?',
        'No. Fluoride is the ion of the element fluorine. In water at recommended levels it helps remineralize tooth enamel.'
      ),
      (
        'Can I filter it out if I choose?',
        'Yes. Several home filtration methods can reduce fluoride. Public systems serve the common benefit; personal choice remains.'
      ),
      (
        'What about infants and formula?',
        'Use guidance from pediatric and dental providers. Utilities publish fluoride levels so caregivers can make informed choices.'
      ),
      (
        'Is this mass medication?',
        'No. Fluoridation adjusts a naturally occurring mineral to a level shown to reduce decay, comparable to iodized salt.'
      ),
    ];

    return Scaffold(
      appBar: const NavBar(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: MaxWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('FAQ', style: Theme.of(context).textTheme.displaySmall),
                  const SizedBox(height: 16),
                  ...faqs.map((e) => _Faq(q: e.$1, a: e.$2)),
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

class _Faq extends StatelessWidget {
  final String q, a;
  const _Faq({required this.q, required this.a});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text(q, style: Theme.of(context).textTheme.titleMedium),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Align(alignment: Alignment.centerLeft, child: Text(a)),
          )
        ],
      ),
    );
  }
}
