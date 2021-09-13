import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/todo_model/todo_model.dart';
import 'package:todo/screens/main_screen/todo_tab/todo_tab.dart';

void main() {
  testWidgets("Tap checkbox", (tester) async {
    var todoModel = TodoModel();
    await tester.pumpWidget(MaterialApp(
      home: ChangeNotifierProvider(
          create: (context) {
            return TodoModel();
          },
          child: TodoTab()),
    ));
    var checkBox = find.byType(Checkbox);
    expect(checkBox, findsNWidgets(6));
    for (int i = 0; i < todoModel.todos.length; i++) {
      await tester.tap(checkBox.at(i));
    }
    await tester.pump();
    var checkboxList = checkBox.evaluate().map((e) => e.widget as Checkbox).toList();

    for (int i = 0; i < todoModel.todos.length; i++) {
      expect(todoModel.todos[i].isCompleted, !checkboxList[i].value!);
    }
    await tester.pump();
  });
}
