import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];

  // reference the box
  final _todoBox = Hive.box('todobox');

  // first data on while opening the app for the first time
  void createInitialData() {
    toDoList = [
      ['Go Gym', false],
      ['Read Books', false],
      ['Call Home', false],
    ];
  }

  // Load the data from database
  void loadData(){
    toDoList = _todoBox.get('todolist');

  }

  // update the database
  void updateData(){
    _todoBox.put('todolist', toDoList);

  }
}
