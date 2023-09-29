import 'package:fit/themes/fit_app_colors.dart';
import 'package:flutter/material.dart';

class CircuitEditPage extends StatelessWidget {
  const CircuitEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    final FitAppColors fitAppColors =
        Theme.of(context).extension<FitAppColors>()!;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            size: 28,
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
      ),
      body: Column(children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: double.infinity,
          color: Theme.of(context).colorScheme.primary,
          child: Text(
            "Un Exercice".toUpperCase(),
            style: Theme.of(context).textTheme.displayMedium,
          ),
        )
      ]),
    );
  }
}
