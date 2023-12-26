import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/Providers/providers.dart';
import 'package:todo_app/Data/data.dart';

class TaskNotifier extends StateNotifier<TaskState> {
  final TaskRepository _repository;
  TaskNotifier(this._repository) : super(const TaskState.initial());

  Future<void> createTask(Task task) async {
    try {
      await _repository.createTask(task);
      getTask();
    } catch(e) {
      debugPrint(e.toString());
    }
  }

  Future<void> deleteTask(Task task) async {
    try {
      await _repository.deleteTask(task);
      getTask();
    } catch(e) {
      debugPrint(e.toString());
    }
  }

  Future<void> updateTask(Task task) async {
    try {
      final isCompleted = !task.isCompleted;
      final upDatedTask = task.copyWith(isCompleted: isCompleted);
      await _repository.updateTask(upDatedTask);
      getTask();
    } catch(e) {
      debugPrint(e.toString());
    }
  }

  void getTask() async {
    try {
      final tasks = await _repository.getAllTask();
      state = state.copyWith(tasks: tasks);
    } catch(e) {
      debugPrint(e.toString());
    }
  }

}