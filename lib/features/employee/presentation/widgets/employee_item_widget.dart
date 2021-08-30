import 'package:flutter/material.dart';
import 'package:liberty_employee/core/constants/strings.dart';
import 'package:liberty_employee/core/services/assets_service.dart';
import 'package:liberty_employee/core/ui/styles.dart';
import 'package:liberty_employee/features/employee/domain/entity/employee_entity.dart';

class EmployeeItem extends StatelessWidget {
  final Employee employee;

  const EmployeeItem({Key key, this.employee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Styles.edgeInsetsS),
      child: Container(
        height: 55,
        color: Styles.lightScaffoldBackground,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Styles.edgeInsetsM),
          child: Row(
              children: [
                SizedBox(
                  width: 250,
                  child: Row(
                    children: [
                      CircleAvatar(
                          radius: 18,
                          backgroundImage: AssetImage(
                              AssetsService.getAssetLocation(AssetKey.profile_pic))),
                      SizedBox(
                        width: Styles.edgeInsetsML,
                      ),
                      Text(employee.name, style: Theme.of(context).textTheme.subtitle2.copyWith(fontWeight: FontWeight.w700),),
                      SizedBox(
                        width: Styles.edgeInsetsML,
                      )
                    ],
                  ),
                ),
            Text(employee.jobPosition),
            Spacer(),
            Container(
              height: 8.0,
              width: 8.0,
              decoration: BoxDecoration(
                color: employee.present ? Styles.green : Styles.red,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(
              width: Styles.edgeInsetsS,
            ),
            employee.present ? Text(Strings.present) : Text(Strings.absent),
          ]),
        ),
      ),
    );
  }
}
