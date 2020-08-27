import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_lnl/src/blocs/todo_bloc.dart';
import 'package:todo_lnl/src/models/todo_item.dart';

class TodoList extends StatefulWidget {
  TodoList({Key key}) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: BlocProvider(
          create: (context) => TodoBloc(),
          child: BlocBuilder<TodoBloc, TodoState>(
            builder: (context, state) {
              if (state is TodoInitial) {
                BlocProvider.of<TodoBloc>(context).add(GetItems());
              }
              if (state is ItemsLoaded) {
                var items = state.items;
                return Center(
                  child: Container(
                    child: ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (BuildContext context, int index) {
                          return buildListItems(context, index, items);
                        }),
                  ),
                );
              } else {
                return Center(
                  child: Container(child: Text("No items to display.")),
                );
              }
            },
          )),
    );
  }

  Widget buildListItems(BuildContext context, int index, List<TodoItem> items) {
    return GestureDetector(
      onTap: () => {
        BlocProvider.of<TodoBloc>(context)
            .add(CompleteItem(items, items[index])),
      },
      child: Container(
        height: 50,
        color: Colors.amber,
        child: Center(child: Text(items[index].task)),
      ),
    );
  }
}
