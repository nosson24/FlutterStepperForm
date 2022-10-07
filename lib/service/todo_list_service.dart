import 'package:flutter_to_do_list/model/todo_model.dart';

class ToDoListService {
  static final List<ToDoModel> _toDoList = [];

  static List<ToDoModel> getToDoList() {
    return _toDoList;
  }

  static saveToDo(ToDoModel toDo) {
    _toDoList.add(toDo);
  }

  static reMoveToDo(toDo) {
    _toDoList.remove(toDo);
  }
}
