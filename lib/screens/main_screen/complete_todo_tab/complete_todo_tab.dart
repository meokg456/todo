import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/todo_model/todo_model.dart';
import 'package:todo/widgets/todo_widget/todo_widget.dart';

class CompleteTodoTab extends StatefulWidget {
  const CompleteTodoTab({Key? key}) : super(key: key);

  @override
  _CompleteTodoTabState createState() => _CompleteTodoTabState();
}

class _CompleteTodoTabState extends State<CompleteTodoTab> {
  @override
  Widget build(BuildContext context) {
    var todoModel = Provider.of<TodoModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Completed TODO"),
        centerTitle: true,
      ),
      body: ListView(
        children: todoModel.todos
            .where((todo) => todo.isCompleted)
            .map(
              (todo) => TodoWidget(todo),
            )
            .toList(),
      ),
    );
  }
}
