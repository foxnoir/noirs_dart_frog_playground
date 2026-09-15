import 'package:equatable/equatable.dart';

class Person extends Equatable {
  const Person({required this.name, required this.age});
  final String name;
  final int age;

  @override
  List<Object> get props => [name, age];
}
