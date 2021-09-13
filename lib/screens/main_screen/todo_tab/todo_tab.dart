import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/todo_model/todo_model.dart';
import 'package:todo/widgets/todo_widget/todo_widget.dart';

class TodoTab extends StatefulWidget {
  const TodoTab({Key? key}) : super(key: key);

  @override
  _TodoTabState createState() => _TodoTabState();
}

class _TodoTabState extends State<TodoTab> {
  @override
  Widget build(BuildContext context) {
    var todoModel = Provider.of<TodoModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("TODO"),
        centerTitle: true,
      ),
      body: ListView(
        children: todoModel.todos
            .map(
              (todo) => TodoWidget(todo),
            )
            .toList(),
      ),
    );
  }
}
