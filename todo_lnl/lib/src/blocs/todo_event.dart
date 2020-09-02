part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent {}

class GetItems extends TodoEvent {}

class CompleteItem extends TodoEvent {
  final List<TodoItem> items;
  final TodoItem selectedItem;
  CompleteItem(this.items, this.selectedItem);
}

class DeleteItem extends TodoEvent {}

class RefreshItems extends TodoEvent {}

class AddItemToList extends TodoEvent {
  final TodoItem item;

  AddItemToList(this.item);
}
