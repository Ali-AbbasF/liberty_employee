import 'package:flutter/material.dart';
import 'package:liberty_employee/core/constants/strings.dart';
import 'package:liberty_employee/core/enums/side_menu_enums.dart';
import 'package:liberty_employee/core/services/assets_service.dart';
import 'package:liberty_employee/core/ui/components/c_button.dart';
import 'package:liberty_employee/core/ui/components/popup_view.dart';
import 'package:liberty_employee/core/ui/screens/side_menu_page.dart';
import 'package:liberty_employee/core/ui/styles.dart';
import 'package:liberty_employee/features/employee/domain/entity/employee_entity.dart';
import 'package:liberty_employee/features/employee/presentation/bloc/employees_bloc.dart';
import 'package:liberty_employee/features/employee/presentation/bloc/employees_enums.dart';
import 'package:liberty_employee/features/employee/presentation/widgets/add_employee_form.dart';
import 'package:liberty_employee/features/employee/presentation/widgets/employee_item_widget.dart';

class EmployeesPage extends StatefulWidget {
  @override
  _EmployeesPageState createState() => _EmployeesPageState();
}

class _EmployeesPageState extends State<EmployeesPage> {
  final EmployeesBloc bloc = EmployeesBloc();

  @override
  Widget build(BuildContext context) {
    return SideMenuPage(
      bodyLeft: Container(
        padding: const EdgeInsets.symmetric(vertical: Styles.edgeInsetsM, horizontal: Styles.edgeInsetsM),
        child: StreamBuilder<List<Employee>>(
            stream: bloc.getStream(EmployeesEnums.employeesList),
            builder: (context, snapshot) {
              if (snapshot.hasData)
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      snapshot.data.isEmpty ? Strings.noEmployeesAdded : Strings.employees,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: Styles.edgeInsetsM,
                    ),
                    SingleChildScrollView(
                      child: Column(children: [
                        for (int index = 0;
                            index < snapshot.data.length;
                            index++)
                          InkWell(
                            highlightColor: Colors.transparent,
                            onTap: () => bloc.setValue(
                                EmployeesEnums.selectedEmployee,
                                snapshot.data[index]),
                            child: EmployeeItem(
                              employee: snapshot.data[index],
                            ),
                          )
                      ]),
                    ),
                  ],
                );
              else
                return SizedBox.shrink();
            }),
      ),
      options: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Styles.edgeInsetsML),
        child: Row(
          children: [
            CButton(
              text: Strings.addEmployee,
              onPressed: () => popupView(
                  context,
                  AddEmployeeForm(
                    bloc: bloc,
                  )),
            ),
            SizedBox(
              width: Styles.edgeInsetsML,
            ),
            CButton(
              text: Strings.attendance,
            ),
            SizedBox(
              width: Styles.edgeInsetsML,
            ),
            CButton(
              text: Strings.payroll,
            ),
          ],
        ),
      ),
      bodyRight: StreamBuilder<Employee>(
          stream: bloc.getStream<Employee>(EmployeesEnums.selectedEmployee),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Employee employee = snapshot.data;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0,Styles.edgeInsetsL,
                        Styles.edgeInsetsL,0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 8.0,
                          width: 8.0,
                          decoration: new BoxDecoration(
                            color: employee.present ? Styles.green : Styles.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: Styles.edgeInsetsS,),
                        employee.present
                            ? Text(Strings.present)
                            : Text(Strings.absent),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Styles.edgeInsetsL),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 60.0,
                          backgroundImage: AssetImage(
                              AssetsService.getAssetLocation(
                                  AssetKey.profile_pic)),
                        ),
                        SizedBox(
                          width: Styles.edgeInsetsML,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              employee.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: Styles.edgeInsetsM),
                            Text(
                              employee.jobPosition,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Styles.edgeInsetsML,
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Lorem Ipsum'),
                      Text('Lorem Ipsum'),
                      Text('Lorem Ipsum'),
                      Text('Lorem Ipsum'),
                    ],
                  ),
                  Divider(),
                  SizedBox(
                    height: Styles.edgeInsetsML,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Styles.edgeInsetsL),
                    child: Text('More Information about ${employee.name} here...'),
                  ),
                ],
              );
            } else
              return SizedBox.shrink();
          }),
      selectedPage: SideMenuEnums.employees,
    );
  }
}
