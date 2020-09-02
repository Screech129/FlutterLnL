import 'package:todo_lnl/src/models/todo_item.dart';

class TodoRepository {
  List<TodoItem> items = List<TodoItem>();

  TodoRepository() {
    items.add(new TodoItem(
      complete: false,
      id: "0",
      note: "Extra Stuff",
      task: "Item1",
    ));
    items.add(new TodoItem(
      complete: false,
      id: "1",
      note: "More Extra Stuff",
      task: "Item2",
    ));
    items.add(new TodoItem(
      complete: false,
      id: "2",
      note: "Stuff",
      task: "Item3",
    ));
    items.add(new TodoItem(
      complete: false,
      id: "3",
      note: "Extra Things and Stuff",
      task: "Item4",
    ));
    items.add(new TodoItem(
      complete: false,
      id: "4",
      note: "Extra",
      task: "Item5",
    ));
  }

  Future<List<TodoItem>> getItems() async {
    return items;
  }

  void completeItem(String itemId) {
    items.firstWhere((i) => i.id == itemId).complete = true;
  }

  void addItem(TodoItem item) {
    items.add(item);
  }

  String getHighestId() {
    items.sort((a, b) => a.id.compareTo(b.id));
    return items.last.id;
  }
}

TodoRepository repository = TodoRepository();
