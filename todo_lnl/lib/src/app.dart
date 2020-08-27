import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_lnl/src/pages/todoList.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List LnL',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoList(),
    );
  }
}
