import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/todo_model/todo_model.dart';
import 'package:todo/screens/main_screen/complete_todo_tab/complete_todo_tab.dart';
import 'package:todo/screens/main_screen/incomplete_todo_tab/incomplete_todo_tab.dart';
import 'package:todo/screens/main_screen/todo_tab/todo_tab.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  var _tabs = [
    TodoTab(),
    CompleteTodoTab(),
    IncompleteTodoTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.task), label: "Todo"),
          BottomNavigationBarItem(icon: Icon(Icons.task), label: "Completed Todo"),
          BottomNavigationBarItem(icon: Icon(Icons.task), label: "Incomplete Todo"),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
      ),
      body: ChangeNotifierProvider(
          create: (context) {
            return TodoModel();
          },
          child: _tabs[_currentIndex]),
    );
  }
}
