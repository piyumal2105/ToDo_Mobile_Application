import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/Utils/task_categories.dart';

final categoryProvider = StateProvider.autoDispose<TaskCategories>((ref) {
  return TaskCategories.others;
});