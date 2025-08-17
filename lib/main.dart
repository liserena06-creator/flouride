import 'package:flutter/material.dart';
import 'theme.dart';
import 'pages/home_page.dart';
import 'pages/science_page.dart';
import 'pages/faq_page.dart';
import 'pages/about_page.dart';
import 'pages/get_involved_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const FluorideApp());
}

class FluorideApp extends StatelessWidget {
  const FluorideApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Keep Fluoride',
      debugShowCheckedModeBanner: false,
      theme: buildTheme(),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/science': (context) => const SciencePage(),
        '/faq': (context) => const FaqPage(),
        '/about': (context) => const AboutPage(),
        '/get-involved': (context) => const GetInvolvedPage(),
      },
    );
  }
}
