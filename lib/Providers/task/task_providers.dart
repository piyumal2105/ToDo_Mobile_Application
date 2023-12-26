import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/Providers/providers.dart';
import 'package:todo_app/Data/data.dart';

final taskProvoder = StateNotifierProvider<TaskNotifier, TaskState>((ref) {
  final repository = ref.watch(taskRepositoryProvider);
  return TaskNotifier(repository);
});