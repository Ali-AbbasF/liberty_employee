import 'package:flutter/material.dart';
import 'package:liberty_employee/core/constants/strings.dart';
import 'package:liberty_employee/core/enums/side_menu_enums.dart';
import 'package:liberty_employee/core/ui/styles.dart';
import 'package:liberty_employee/core/ui/widgets/side_menu_item.dart';
import 'package:liberty_employee/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:liberty_employee/features/employee/presentation/pages/employees_page.dart';
import 'package:liberty_employee/features/site/presentation/pages/site_page.dart';

class SideMenuWidget extends StatelessWidget {
  final SideMenuEnums selectedPage;

  const SideMenuWidget({Key key, this.selectedPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: Styles.headerHeight,
          width: 250,
          color: Styles.primaryColor,
          child: Text(
            Strings.liberty_group,
            style: Theme.of(context).textTheme.headline5.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Container(
            width: 250,
            color: Styles.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Styles.edgeInsetsML,),
                SideMenuItem(
                  icon: Icons.dashboard_outlined,
                  title: Strings.dashboard,
                  selected: selectedPage == SideMenuEnums.dashboard,
                  page: DashboardPage(),
                ),
                SideMenuItem(
                  icon: Icons.person_outline,
                  title: Strings.employees,
                  selected: selectedPage == SideMenuEnums.employees,
                  page: EmployeesPage(),
                ),
                SideMenuItem(
                  icon: Icons.web,
                  title: Strings.sites,
                  selected: selectedPage == SideMenuEnums.sites,
                  page: SitePage(),
                ),
                SideMenuItem(
                  icon: Icons.book,
                  title: Strings.items,
                  selected: selectedPage == SideMenuEnums.items,
                ),
                SideMenuItem(
                  icon: Icons.home_outlined,
                  title: Strings.warehouse,
                  selected: selectedPage == SideMenuEnums.warehouse,
                ),
                SideMenuItem(
                  icon: Icons.handyman_outlined,
                  title: Strings.production,
                  selected: selectedPage == SideMenuEnums.production,
                ),
                SideMenuItem(
                  icon: Icons.stacked_line_chart_outlined,
                  title: Strings.parameters,
                  selected: selectedPage == SideMenuEnums.parameters,
                ),
                SideMenuItem(
                  icon: Icons.directions_car_rounded,
                  title: Strings.vehicle,
                  selected: selectedPage == SideMenuEnums.vehicle,
                ),
                SideMenuItem(
                  icon: Icons.settings,
                  title: Strings.settings,
                  selected: selectedPage == SideMenuEnums.setting,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
