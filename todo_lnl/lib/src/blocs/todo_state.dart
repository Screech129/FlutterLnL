part of 'todo_bloc.dart';

@immutable
abstract class TodoState {}

class TodoInitial extends TodoState {}

class ItemsLoading extends TodoState {}

class ItemsLoaded extends TodoState {
  final List<TodoItem> items;

  ItemsLoaded(this.items);
}

class ItemDeleting extends TodoState {}

class ItemComplete extends TodoState {}
