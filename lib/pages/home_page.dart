import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/data/database.dart';
import 'package:to_do_app/utility/dialog_box.dart';
import 'package:to_do_app/utility/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key); // Added 'Key' parameter for the constructor

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Reference to the Hive box for storing tasks
  final _todoBox = Hive.box('todobox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    super.initState();
    // Load initial data when opening the app for the first time
    if (_todoBox.isEmpty) {
      db.createInitialData();
      db.updateData();
    } else {
      db.loadData();
    }
  }

  final _controller = TextEditingController();

  // Function to change the value of a checkbox
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateData();
  }

  // Function to save a new task
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.pop(context);
    db.updateData();
  }

  // Create a new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          OnSave: saveNewTask,
          OnCancel: () => Navigator.of(context).pop(),
        );
      },
    );
    db.updateData();
  }

  // Function to delete a task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 165, 168, 170),
      appBar: AppBar(
        // Center the title
        centerTitle: true,
        title: const Text('To-Do App'),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 94, 81, 81),
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
