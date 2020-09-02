import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_lnl/src/blocs/todo_bloc.dart';
import 'package:todo_lnl/src/models/todo_item.dart';
import 'package:todo_lnl/src/widgets/styled_sized_box.dart';
import 'package:todo_lnl/src/widgets/styled_text_field.dart';

class AddItem extends StatefulWidget {
  AddItem({Key key}) : super(key: key);

  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  bool hasError;
  TodoItem item = TodoItem();
  @override
  void initState() {
    this.hasError = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Item'),
      ),
      body: BlocProvider(
          create: (context) => TodoBloc(),
          child: BlocConsumer<TodoBloc, TodoState>(
            listener: (context, state) {
              if (state is ItemAdded) {
                final scaffold = Scaffold.of(context);
                scaffold.showSnackBar(
                  SnackBar(
                    content: Text('Item Added'),
                    backgroundColor: Colors.green,
                  ),
                );
              }
            },
            builder: (context, state) {
              return Container(
                child: Column(
                  children: [
                    StyledSizedBox(),
                    StyledTextField(
                      label: "Task",
                      errorMessage: "Task is required",
                      onTextChanged: (String value, bool hasError) {
                        this.hasError = hasError;
                        item.task = value;
                      },
                    ),
                    StyledSizedBox(),
                    StyledTextField(
                      label: "Notes",
                      onTextChanged: (String value, bool hasError) {
                        item.note = value;
                      },
                    ),
                    StyledSizedBox(),
                    RaisedButton(
                        color: Theme.of(context).accentColor,
                        onPressed: () => {
                              if (!this.hasError)
                                {
                                  BlocProvider.of<TodoBloc>(context)
                                      .add(AddItemToList(item))
                                }
                            },
                        child: Text("Add Item"))
                  ],
                ),
              );
            },
          )),
    );
  }
}
