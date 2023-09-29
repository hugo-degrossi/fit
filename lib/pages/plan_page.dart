import 'package:fit/provider/app_context.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlanPage extends StatelessWidget {
  const PlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appContext = context.watch<AppContext>();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () => {appContext.addCircuit("Abdos Intensifs")},
              child: const Text("ADD")),
          ElevatedButton(
              onPressed: () => {appContext.clear()},
              child: const Text("CLEAR")),
          ElevatedButton(
              onPressed: () => {appContext.getCircuit()},
              child: const Text("RETRIEVE")),
          ElevatedButton(
              onPressed: () => {print(appContext.getCircuitsList().toString())},
              child: const Text("GET")),
        ],
      ),
    );
    ;
  }
}
