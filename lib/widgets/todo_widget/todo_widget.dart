import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/todo_model/todo.dart';
import 'package:todo/models/todo_model/todo_model.dart';

class TodoWidget extends StatefulWidget {
  const TodoWidget(this.todo);

  final Todo todo;

  @override
  _TodoWidgetState createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  @override
  Widget build(BuildContext context) {
    var todoModel = Provider.of<TodoModel>(context);
    return ListTile(
      leading: Icon(
        Icons.task,
        color: Theme.of(context).primaryColor,
      ),
      title: Text(widget.todo.name),
      trailing: Checkbox(
        value: widget.todo.isCompleted,
        onChanged: (bool? value) {
          todoModel.setTodoStatus(widget.todo, value);
        },
      ),
    );
  }
}
