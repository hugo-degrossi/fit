import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InfoSnippet extends StatelessWidget {
  final String value;
  final IconData icon;

  const InfoSnippet({super.key, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 16,
          color: Theme.of(context).colorScheme.tertiary,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(value, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}
