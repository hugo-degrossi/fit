import 'package:fit/pages/circuits_page.dart';
import 'package:fit/pages/journey_page.dart';
import 'package:fit/pages/plan_page.dart';
import 'package:fit/provider/app_context.dart';
import 'package:fit/themes/fit_app_colors.dart';
import 'package:fit/widgets/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animations/animations.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  _getWidget(int index) {
    switch (index) {
      case 0:
        return const PlanPage();
      case 1:
        return const JourneyPage();
      case 2:
        return const CircuitsPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    var appContext = context.watch<AppContext>();
    var selectedIndex = appContext.selectedNavIndex;

    final FitAppColors fitAppColors =
        Theme.of(context).extension<FitAppColors>()!;

    appContext.init();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 10),
            Text("fit.", style: Theme.of(context).textTheme.displayLarge),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: PageTransitionSwitcher(
        transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
          return SharedAxisTransition(
            animation: primaryAnimation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.vertical,
            child: child,
          );
        },
        child: Padding(
          key: ValueKey<int>(selectedIndex),
          padding: const EdgeInsets.all(8.0),
          child: _getWidget(selectedIndex),
        ),
      ),
      floatingActionButton: selectedIndex == 2
          ? FloatingActionButton(
              onPressed: () => {},
              elevation: 0,
              backgroundColor: Theme.of(context).colorScheme.tertiary,
              child: Icon(
                Icons.add,
                color: Theme.of(context).colorScheme.background,
              ),
            )
          : null,
      bottomNavigationBar: const NavBar(),
    );
  }
}
