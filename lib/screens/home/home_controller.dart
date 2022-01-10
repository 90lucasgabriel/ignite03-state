import 'package:ignite_flutter_todo_list/shared/models/todo_item.dart';
import 'package:ignite_flutter_todo_list/widgets/state_manager/state_manager.dart';

class HomeController extends StateManager<List> {
  final _toDoItemList = <ToDoItem>[];
  final _doneItemList = <ToDoItem>[];

  HomeController() : super(initialState: []);

  List<ToDoItem> get todoItemList => _toDoItemList;
  List<ToDoItem> get doneItemList => _doneItemList;

  void onAddItem(String itemTitle) {
    _toDoItemList.add(
      ToDoItem(
        title: itemTitle,
      ),
    );
  }

  void onResetItem(ToDoItem item) {
    _doneItemList.remove(item);

    _toDoItemList.add(
      ToDoItem(
        title: item.title,
      ),
    );
  }

  void onRemoveToDoItem(ToDoItem item) {
    _toDoItemList.remove(item);
  }

  void onRemoveDoneItem(ToDoItem item) {
    _doneItemList.remove(item);
  }

  void onCompleteItem(ToDoItem item) {
    _toDoItemList.remove(item);

    _doneItemList.add(
      ToDoItem(
        title: item.title,
        isDone: true,
      ),
    );
  }
}
