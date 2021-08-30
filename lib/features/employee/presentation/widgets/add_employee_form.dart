import 'package:flutter/material.dart';
import 'package:liberty_employee/core/constants/strings.dart';
import 'package:liberty_employee/core/ui/components/c_button.dart';
import 'package:liberty_employee/core/ui/components/c_drop_down.dart';
import 'package:liberty_employee/core/ui/components/c_textfield.dart';
import 'package:liberty_employee/core/ui/styles.dart';
import 'package:liberty_employee/features/employee/presentation/bloc/employees_bloc.dart';
import 'package:liberty_employee/features/employee/presentation/bloc/employees_enums.dart';

class AddEmployeeForm extends StatelessWidget {
  final EmployeesBloc bloc;

  const AddEmployeeForm({Key key, this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 455,
      width: 500,
      child: Padding(
        padding: const EdgeInsets.all(Styles.edgeInsetsM),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(Strings.addEmployee, style: Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold),),
                Spacer(),
                InkWell(
                  child: Icon(Icons.clear),
                  onTap: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            SizedBox(height: Styles.edgeInsetsML,),
            CTextField(
              hintText: Strings.name,
              maxLines: 1,
              onChange: (value) => bloc.setValue(EmployeesEnums.name, value),
            ),
            SizedBox(
              height: Styles.edgeInsetsM,
            ),
            Row(
              children: [
                Expanded(
                    child: CDropDown(
                  items: Strings.agesList,
                  hintText: Strings.age,
                  onChange: (value) => bloc.setValue(EmployeesEnums.age, value),
                )),
                SizedBox(
                  width: Styles.edgeInsetsM,
                ),
                Expanded(
                    child: CDropDown(
                  items: Strings.rolesList,
                  hintText: Strings.role,
                  onChange: (value) =>
                      bloc.setValue(EmployeesEnums.role, value),
                )),
              ],
            ),
            SizedBox(
              height: Styles.edgeInsetsM,
            ),
            Row(
              children: [
                Expanded(
                    child: CDropDown(
                  items: Strings.categoryList,
                  hintText: Strings.category,
                  onChange: (value) => bloc.setValue(EmployeesEnums.age, value),
                )),
                SizedBox(
                  width: Styles.edgeInsetsM,
                ),
                Expanded(
                    child: CDropDown(
                  items: [],
                  hintText: ' ',
                  onChange: (value) {},
                )),
              ],
            ),
            SizedBox(
              height: Styles.edgeInsetsM,
            ),
            CTextField(
              height: 100,
              maxLines: 4,
              hintText: Strings.description,
            ),
            SizedBox(
              height: Styles.edgeInsetsM,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: CButton(
                    widget: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.camera_alt, size: 16,),
                        SizedBox(
                          width: Styles.edgeInsetsM,
                        ),
                        Text(Strings.captureImage, style: Theme.of(context).textTheme.bodyText1)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: Styles.edgeInsetsM,
                ),
                Expanded(
                  child: CButton(
                      widget: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.description,
                        size: 16,
                      ),
                      SizedBox(
                        width: Styles.edgeInsetsM,
                      ),
                      Text(Strings.scanDocument, style: Theme.of(context).textTheme.bodyText1),
                    ],
                  )),
                )
              ],
            ),
            SizedBox(
              height: Styles.edgeInsetsL,
            ),
            Row(
              children: [
                Expanded(
                    child: SizedBox(
                      height: 40,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all(Colors.black),
                          backgroundColor: MaterialStateProperty.all(Colors.black),
                        ),
                          onPressed: () => bloc.addEmployee(context),
                          child: Text(Strings.add, style: Theme.of(context).accentTextTheme.subtitle2,)),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
