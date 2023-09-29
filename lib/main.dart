import 'package:fit/models/circuit_model.dart';
import 'package:fit/pages/home_page.dart';
import 'package:fit/provider/app_context.dart';
import 'package:fit/themes/dark_theme_custom.dart';
import 'package:fit/themes/light_theme_custom.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CircuitAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppContext(),
      child: MaterialApp(
        title: 'fit.',
        theme: lightThemeCustom,
        darkTheme: darkThemeCustom,
        home: const HomePage(),
      ),
    );
  }
}
