import 'package:flutter/material.dart';
import 'package:liberty_employee/core/enums/side_menu_enums.dart';
import 'package:liberty_employee/core/ui/screens/side_menu_page.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SideMenuPage(
      bodyLeft: Center(
        child: Text('Dashboard', style: Theme.of(context).textTheme.headline4.copyWith(fontWeight: FontWeight.bold),),
      ),
      selectedPage: SideMenuEnums.dashboard,
    );
  }
}
