import 'package:fit/provider/app_context.dart';
import 'package:fit/widgets/circuit_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CircuitsPage extends StatelessWidget {
  const CircuitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appContext = context.watch<AppContext>();
    List<dynamic> circuitList = appContext.getCircuitsList();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "${circuitList.length} Circuits.",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              width: 20,
            )
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: circuitList.length,
            itemBuilder: (BuildContext context, int index) {
              return CircuitCard(circuit: circuitList[index], index: index);
            },
          ),
        ),
      ],
    );
  }
}
