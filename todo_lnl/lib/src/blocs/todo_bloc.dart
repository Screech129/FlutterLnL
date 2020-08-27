import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:todo_lnl/src/models/todo_item.dart';
import 'package:todo_lnl/src/repositories/todoRepository.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial());

  @override
  Stream<TodoState> mapEventToState(
    TodoEvent event,
  ) async* {
    if (event is GetItems) {
      yield ItemsLoading();
      var items =
          repository.getItems().where((item) => !item.complete).toList();
      yield ItemsLoaded(items);
    }

    if (event is CompleteItem) {
      yield ItemComplete();
      repository.completeItem(event.selectedItem.id);
      var items =
          repository.getItems().where((item) => !item.complete).toList();
      yield ItemsLoaded(items);
    }
  }
}
