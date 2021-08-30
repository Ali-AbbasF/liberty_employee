import 'package:flutter/material.dart';
import 'package:liberty_employee/core/ui/styles.dart';
import 'package:liberty_employee/features/dashboard/presentation/pages/dashboard_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Styles.theme(),
      home: DashboardPage(),
    );
  }
}
