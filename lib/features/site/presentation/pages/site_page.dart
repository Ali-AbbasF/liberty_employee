import 'package:flutter/material.dart';
import 'package:liberty_employee/core/enums/side_menu_enums.dart';
import 'package:liberty_employee/core/ui/screens/side_menu_page.dart';

class SitePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SideMenuPage(
      selectedPage: SideMenuEnums.dashboard,
    );
  }
}
