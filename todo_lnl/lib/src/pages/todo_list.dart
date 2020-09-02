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
        leading: GestureDetector(
          child: Center(
            child: Text(
              "+",
              style: TextStyle(fontSize: 25),
            ),
          ),
          onTap: () => {Navigator.pushNamed(context, "Add")},
        ),
      ),
      body: BlocProvider(
          create: (context) => TodoBloc(),
          child: BlocConsumer<TodoBloc, TodoState>(
            listener: (context, state) {
              if (state is ItemComplete) {
                final scaffold = Scaffold.of(context);
                scaffold.showSnackBar(
                  SnackBar(
                    content: Text('Item completed'),
                    backgroundColor: Colors.green,
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is TodoInitial) {
                BlocProvider.of<TodoBloc>(context).add(GetItems());
              }
              if (state is ItemsLoaded) {
                var items = state.items;
                return Center(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      _refreshList(context);
                    },
                    child: Container(
                      child: ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (BuildContext context, int index) {
                            return buildListItems(context, index, items);
                          }),
                    ),
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
    return Dismissible(
      direction: DismissDirection.startToEnd,
      background: Container(
        alignment: Alignment.centerLeft,
        color: Colors.green,
        margin: EdgeInsets.only(top: 10),
        child: Container(
          child: Icon(
            Icons.check,
            color: Colors.white,
          ),
        ),
      ),
      key: Key(items[index].id),
      onDismissed: (direction) {
        BlocProvider.of<TodoBloc>(context)
            .add(CompleteItem(items, items[index]));
      },
      child: Container(
        margin: EdgeInsets.only(top: 10),
        height: 50,
        color: Colors.grey[300],
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(items[index].task),
            Text("Notes: ${items[index].note}")
          ],
        )),
      ),
    );
  }

  Future<void> _refreshList(BuildContext context) async {
    await Future.delayed(Duration(milliseconds: 1));
    BlocProvider.of<TodoBloc>(context).add(GetItems());
  }
}
