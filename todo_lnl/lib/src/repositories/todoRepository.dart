import 'package:todo_lnl/src/models/todo_item.dart';

class TodoRepository {
  List<TodoItem> items = List<TodoItem>();

  TodoRepository() {
    items.add(new TodoItem(false, "0", "Extra Stuff", "Item1"));
    items.add(new TodoItem(false, "1", "More Extra Stuff", "Item2"));
    items.add(new TodoItem(false, "2", "Stuff", "Item3"));
    items.add(new TodoItem(false, "3", "Extra Things and Stuff", "Item4"));
    items.add(new TodoItem(false, "4", "Extra", "Item5"));
  }

  List<TodoItem> getItems() {
    return items;
  }

  void completeItem(String itemId) {
    items.firstWhere((i) => i.id == itemId).complete = true;
  }
}

TodoRepository repository = TodoRepository();
