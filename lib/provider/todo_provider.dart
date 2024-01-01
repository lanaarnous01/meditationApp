import 'package:api_animals/models/todo_model.dart';
import 'package:api_animals/services/note_service.dart';
import 'package:flutter/material.dart';

class TodoProvider extends ChangeNotifier {
  List<Todo> todosList = [];
  final _todoService = TodoService();

  Future<void> getTodos() async {
    todosList = await _todoService.getTodoList();
    notifyListeners();
  }

  updateTodo(String id, bool? value) async {
    await _todoService.updateTodo(id, value);
    await getTodos();
  }

  createNewNote(String title, bool? isComplete) async {
    await _todoService.createTodo(title, isComplete);
    await getTodos();
  }
}