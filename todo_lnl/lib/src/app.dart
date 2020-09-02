import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_lnl/src/pages/add_item.dart';
import 'package:todo_lnl/src/pages/todo_list.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List LnL',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: _buildRoutes,
    );
  }

  Route _buildRoutes(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return TodoList();
          },
        );
        break;
      case "Add":
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return AddItem();
          },
        );
        break;
      default:
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return TodoList();
          },
        );
        break;
    }
  }
}
