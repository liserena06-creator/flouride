import 'package:flutter/material.dart';
import 'package:dentalweb/widgets/nav_bar.dart';
import 'package:dentalweb/widgets/footer.dart';
import 'package:dentalweb/widgets/responsive.dart';

class GetInvolvedPage extends StatefulWidget {
  const GetInvolvedPage({super.key});
  @override
  State<GetInvolvedPage> createState() => _GetInvolvedPageState();
}

class _GetInvolvedPageState extends State<GetInvolvedPage> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _city = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _city.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
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
                  Text('Get Involved', style: text.displaySmall),
                  const SizedBox(height: 8),
                  const Text('Join updates, volunteer locally, or connect your utility and health partners.'),
                  const SizedBox(height: 16),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _name,
                              decoration: const InputDecoration(labelText: 'Full name'),
                              validator: (v) => (v == null || v.isEmpty) ? 'Required' : null,
                            ),
                            const SizedBox(height: 12),
                            TextFormField(
                              controller: _email,
                              decoration: const InputDecoration(labelText: 'Email'),
                              keyboardType: TextInputType.emailAddress,
                              validator: (v) => (v != null && v.contains('@')) ? null : 'Enter a valid email',
                            ),
                            const SizedBox(height: 12),
                            TextFormField(
                              controller: _city,
                              decoration: const InputDecoration(labelText: 'City / Utility'),
                            ),
                            const SizedBox(height: 16),
                            FilledButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Submitted. Replace with backend integration.')),
                                  );
                                }
                              },
                              child: const Text('Submit'),
                            ),
                            const SizedBox(height: 8),
                            OutlinedButton(
                              onPressed: () {
                                final uri = Uri(
                                  scheme: 'mailto',
                                  path: 'info@keepfluoride.org',
                                  query: Uri.encodeQueryComponent('subject=Volunteer&body=Name: ${_name.text}\nCity: ${_city.text}'),
                                );
                                // ignore: deprecated_member_use
                                // Launch via html in web builds:
                              },
                              child: const Text('Email us instead'),
                            ),
                          ],
                        ),
                      ),
                    ),
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
