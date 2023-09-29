import 'package:fit/models/circuit_model.dart';
import 'package:fit/pages/circuit_edit_page.dart';
import 'package:fit/provider/app_context.dart';
import 'package:fit/themes/fit_app_colors.dart';
import 'package:fit/widgets/custom_chip.dart';
import 'package:fit/widgets/info_snippet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class CircuitCard extends StatelessWidget {
  final Circuit circuit;
  final int index;

  const CircuitCard({super.key, required this.circuit, required this.index});

  @override
  Widget build(BuildContext context) {
    var appContext = context.watch<AppContext>();
    final FitAppColors fitAppColors =
        Theme.of(context).extension<FitAppColors>()!;

    return Container(
      margin: const EdgeInsets.all(8.0),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.background),
      ),
      child: Slidable(
        startActionPane: ActionPane(
          extentRatio: 0.3,
          motion: const ScrollMotion(),
          children: [
            Expanded(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: fitAppColors.delete,
                      minimumSize:
                          const Size(double.infinity, double.infinity)),
                  onPressed: () => {appContext.deleteCircuit(index)},
                  child: const Icon(
                    Icons.delete_outline_outlined,
                    color: Colors.white,
                  )),
            ),
            const SizedBox(width: 15)
          ],
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, _createRoute());
          },
          child: Card(
            color: Theme.of(context).colorScheme.primary,
            margin: const EdgeInsets.all(0),
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        Text(circuit.name.toUpperCase(),
                            style: Theme.of(context).textTheme.displayMedium),
                        const SizedBox(height: 12),
                        const Row(
                          children: [
                            InfoSnippet(
                                value: "0h15", icon: Icons.timer_outlined),
                            SizedBox(width: 12),
                            InfoSnippet(
                                value: "12", icon: Icons.filter_none_rounded),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          children: [
                            Row(
                              children: [
                                //CustomChip(value: circuit.type),
                              ],
                            )
                          ],
                        ),
                        Icon(
                          Icons.chevron_right_rounded,
                          color: Theme.of(context).colorScheme.tertiary,
                        )
                      ],
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const CircuitEditPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
