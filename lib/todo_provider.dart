import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:priority/todo.dart';

class TodosProvider with ChangeNotifier {
  TodosProvider() {
    init();
  }

  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  Isar? isar;

  void init() async {
    isar = await Isar.open([TodoSchema]);
    await isar?.txn(() async {
      final todosCollection = isar?.collection<Todo>();
      _todos = await todosCollection!.where().findAll();
      notifyListeners();
    });
  }

  void addTodo(Todo todo) async {
    await isar!.writeTxn(() async {
      await isar?.todos.put(todo);
      _todos.add(todo);
      notifyListeners();
    });
  }

  Future<List> filterAcc(String label) async {
    return await isar
            ?.collection<Todo>()
            .filter()
            .labelEqualTo(label)
            .findAll() ??
        [];
  }

  void deleteTodo(Todo todo) async {
    await isar?.writeTxn(() async {
      await isar!.todos.delete(todo.id);
      notifyListeners();
      // or delete operations
    });
  }

  // void deleteTodo(Todo todo) async {
  //   await isar!.writeTxn((isar) async {
  //     bool deleted = await isar.todos.delete(todo.id);
  //     if (deleted) _todos.remove(todo);
  //     notifyListeners();
  //   });
  // }

  // void toggleImp(int id) async {
  //   await isar!.writeTxn((isar) async {
  //     Todo? todo = await isar.todos.get(id);
  //     todo!.isImportant = !todo.isImportant;
  //     await isar.todos.put(todo);
  //     int todoIndex = todos.indexWhere((todo) => todo.id == id);
  //     todos[todoIndex].isImportant = todo.isImportant;
  //     notifyListeners();
  //   });
  // }
}
