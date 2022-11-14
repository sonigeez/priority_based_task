import 'package:isar/isar.dart';
part 'todo.g.dart';

@Collection()
class Todo {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment
  late String todo;
  late String label;
  Todo({required this.todo, required this.label});
}
