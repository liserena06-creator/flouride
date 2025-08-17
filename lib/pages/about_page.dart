import 'package:flutter/material.dart';
import 'package:dentalweb/widgets/nav_bar.dart';
import 'package:dentalweb/widgets/footer.dart';
import 'package:dentalweb/widgets/responsive.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  Text('About the Organization', style: Theme.of(context).textTheme.displaySmall),
                  const SizedBox(height: 12),
                  const Text(
                    'We are a non-profit coalition of public health professionals, water operators, and residents. '
                    'Mission: maintain evidence-based community water fluoridation policies and transparent public reporting.',
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Activities include public education, utility support, data transparency projects, and local advocacy consistent with health guidance.',
                  ),
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
