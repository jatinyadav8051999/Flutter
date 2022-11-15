import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app_firebase/models/task.dart';

class Database {
  static final Firestore _db = Firestore.instance;

  static Future<void> addTask(Map<String, dynamic> task) async {
    await _db
        .collection('tasks')
        .document()
        .setData(task);
  }
}import 'package:flutter/material.dart';
import 'package:todo_app_firebase/services/database.dart';
import 'package:todo_app_firebase/widgets/edit_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'To-Do List', home: TodoList());
  }
}

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('To-Do List')),
        body: _getTasks(),
        floatingActionButton: FloatingActionButton(
            onPressed: () => _displayDialog(context),
            tooltip: 'Add Item',
            child: Icon(Icons.add)));
  }

  // Display Add Task Dialog
  Future<void> _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return EditDialog(
              title: 'Add Task',
              positiveAction: 'ADD',
              negativeAction: 'CANCEL',
              submit: _handleDialogSubmission);
        });
  } // Add Task
  void _handleDialogSubmission(String value) {
    var task = <String, dynamic>{
      'content': value,
      'timestamp': DateTime.now().millisecondsSinceEpoch
    };
    Database.addTask(task);
  }

  // Placeholder Function to retrieve Tasks
  Widget _getTasks() {
    return Container();
  }
}