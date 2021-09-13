import 'package:flutter_test/flutter_test.dart';
import 'package:todo/models/todo_model/todo_model.dart';

void main() {
  test("Init TODOs", () {
    var todoModel = TodoModel();
    expect(todoModel.todos.length, 6);
  });

  test("Change Todo status", () {
    var todoModel = TodoModel();
    var todo = todoModel.todos[0];
    todoModel.setTodoStatus(todo, true);
    expect(todo.isCompleted, true);
    todoModel.setTodoStatus(todo, false);
    expect(todo.isCompleted, false);
    todoModel.setTodoStatus(todo, null);
    expect(todo.isCompleted, false);
  });
}
