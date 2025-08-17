import 'package:flutter/material.dart';
import '../widgets/responsive.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onToggleMenu;
  const NavBar({super.key, this.onToggleMenu});

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final menu = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _NavLink(label: 'Home', routeName: '/'),
        _NavLink(label: 'Science', routeName: '/science'),
        _NavLink(label: 'FAQ', routeName: '/faq'),
        _NavLink(label: 'About', routeName: '/about'),
        const SizedBox(width: 8),
        FilledButton(
          onPressed: () => Navigator.pushNamed(context, '/get-involved'),
          child: const Text('Get involved'),
        ),
      ],
    );

    return AppBar(
      backgroundColor: scheme.surface,
      title: Row(
        children: [
          const Icon(Icons.water_drop_outlined),
          const SizedBox(width: 8),
          Text('Keep Fluoride', style: Theme.of(context).textTheme.titleLarge),
        ],
      ),
      actions: isDesktop(context)
          ? [Padding(padding: const EdgeInsets.only(right: 12), child: menu)]
          : [
              IconButton(
                icon: const Icon(Icons.menu),
                onPressed: onToggleMenu,
                tooltip: 'Menu',
              ),
            ],
    );
  }
}

class _NavLink extends StatelessWidget {
  final String label;
  final String routeName;
  const _NavLink({required this.label, required this.routeName});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.pushNamed(context, routeName),
      child: Text(label),
    );
  }
}
