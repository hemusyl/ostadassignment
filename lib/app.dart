import 'package:flutter/material.dart';
import 'os10_button.dart';
import 'navigation_drawer.dart';
import 'buttonType.dart';
import 'alert_dialog.dart';
import 'mediaQuerymultiple.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ' Home Screen',
      home: ResponsiveLayoutScreen(), // Class name
    );
  }
}