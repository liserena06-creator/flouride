import 'package:flutter/material.dart';
import 'package:dentalweb/widgets/nav_bar.dart';
// import 'package:dentalweb/widgets/footer.dart';
import 'package:dentalweb/widgets/sections.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: NavBar(onToggleMenu: () => _scaffoldKey.currentState?.openDrawer()),
      drawer: const _SiteDrawer(),
      body: ListView(
        children: [
          const HeroSection(),
          const SizedBox(height: 16),
          ThreeUpGrid(items: [
            CardItem(Icons.health_and_safety, 'Protects teeth',
                'Fluoridation reduces tooth decay across age groups and socioeconomic status.'),
            CardItem(Icons.attach_money, 'Saves money',
                'Every dollar invested can save in dental treatment costs at the population level.'),
            CardItem(Icons.verified, 'Safe and monitored',
                'Utilities dose within strict guidelines; levels are monitored for safety and efficacy.'),
          ]),
          CtaBanner(
            title: 'Support evidence-based public health',
            buttonText: 'Get involved',
            onPressed: () => Navigator.pushNamed(context, '/get-involved'), // replaced at build
          ),
        ],
      ),
    );
  }
}

class _SiteDrawer extends StatelessWidget {
  const _SiteDrawer();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: [
        const DrawerHeader(child: Text('Keep Fluoride')),
        ListTile(title: const Text('Home'), onTap: () => Navigator.pushNamed(context, '/')),
        ListTile(title: const Text('Science'), onTap: () => Navigator.pushNamed(context, '/science')),
        ListTile(title: const Text('FAQ'), onTap: () => Navigator.pushNamed(context, '/faq')),
        ListTile(title: const Text('About'), onTap: () => Navigator.pushNamed(context, '/about')),
        ListTile(title: const Text('Get involved'), onTap: () => Navigator.pushNamed(context, '/get-involved')),
      ]),
    );
  }
}
