import 'package:flutter/cupertino.dart';
import 'package:todo/models/todo_model/todo.dart';

class TodoModel extends ChangeNotifier {
  List<Todo> todos = [
    Todo("Requirement", true),
    Todo("Design", true),
    Todo("Implement", true),
    Todo("Deploy", false),
    Todo("Testing", true),
    Todo("Maintain", false)
  ];

  void setTodoStatus(Todo todo, bool? value) {
    todo.isCompleted = value ?? false;
    notifyListeners();
  }
}
