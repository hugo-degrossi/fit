import 'package:fit/provider/app_context.dart';
import 'package:fit/themes/fit_app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var appContext = context.watch<AppContext>();
    final FitAppColors fitAppColors =
        Theme.of(context).extension<FitAppColors>()!;

    return NavigationBar(
      backgroundColor: Theme.of(context).colorScheme.background,
      elevation: 0,
      destinations: <Widget>[
        NavigationDestination(
          selectedIcon: Icon(
            Icons.view_agenda,
            color: Theme.of(context).colorScheme.background,
          ),
          icon: Icon(
            Icons.view_agenda_outlined,
            color: Theme.of(context).colorScheme.tertiary,
          ),
          label: 'Plan',
        ),
        NavigationDestination(
          selectedIcon: Icon(
            Icons.rocket_launch,
            color: Theme.of(context).colorScheme.background,
          ),
          icon: Icon(
            Icons.rocket_launch_outlined,
            color: Theme.of(context).colorScheme.tertiary,
          ),
          label: 'Journey',
        ),
        NavigationDestination(
          selectedIcon: Icon(
            Icons.earbuds_rounded,
            color: Theme.of(context).colorScheme.background,
          ),
          icon: Icon(
            Icons.earbuds_outlined,
            color: Theme.of(context).colorScheme.tertiary,
          ),
          label: 'Circuits',
        ),
      ],
      selectedIndex: _selectedIndex,
      onDestinationSelected: (idx) =>
          {_onItemTapped(idx), appContext.setSelectedNavIndex(idx)},
    );
  }
}
