import 'package:flutter/cupertino.dart';
import 'package:liberty_employee/core/blocs/stream_factory.dart';
import 'package:liberty_employee/features/employee/domain/entity/employee_entity.dart';
import 'package:liberty_employee/features/employee/presentation/bloc/employees_enums.dart';

class EmployeesBloc extends StreamFactory<EmployeesEnums> {
  EmployeesBloc() {
    setValue(EmployeesEnums.employeesList, <Employee>[]);
  }

  addEmployee(BuildContext context) {
    List<Employee> list = getValue(EmployeesEnums.employeesList);
    list.add(Employee(
      name: getValue(EmployeesEnums.name) ?? '',
      age: getValue(EmployeesEnums.age) ?? '',
      category: getValue(EmployeesEnums.category) ?? '',
      role: getValue(EmployeesEnums.role) ?? '',
      jobPosition: getValue(EmployeesEnums.role) ?? '',
      description: getValue(EmployeesEnums.description) ?? '',
      present: true,
    ));
    setValue(EmployeesEnums.employeesList, list);
    Navigator.of(context).pop();
  }
}
