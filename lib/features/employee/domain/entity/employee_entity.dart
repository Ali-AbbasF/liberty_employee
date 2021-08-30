import 'package:equatable/equatable.dart';

class Employee extends Equatable {
  final String id;
  final String name;
  final String age;
  final String role;
  final String category;
  final String description;
  final String image;
  final String jobPosition;
  final bool present;

  Employee({
    this.id,
    this.name,
    this.image,
    this.jobPosition,
    this.present,
    this.age,
    this.role,
    this.category,
    this.description
  });

  @override
  List<Object> get props => [
    this.id,
    this.name,
    this.image,
    this.jobPosition,
    this.present,
    this.age,
    this.role,
    this.category,
    this.description,
  ];

}
