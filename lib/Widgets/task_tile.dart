import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:todo_app/Data/data.dart';
import 'package:todo_app/Utils/utils.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key, required this.task});
  final Task task;

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final style = context.textTheme;
    final double iconOpacity = task.isCompleted ? 0.3 : 0.5;
    final backgroundOpacity = task.isCompleted ? 0.1 : 0.3;
    final textDecoration = task.isCompleted ? TextDecoration.lineThrough : TextDecoration.none;

    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        top: 10,
        bottom: 10,
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(9.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: task.category.color.withOpacity(backgroundOpacity),
                border: Border.all(
                  width: 2,
                  color: task.category.color.withOpacity(iconOpacity),
                ),
            ),
            child: Center(
              child: Icon(
                task.category.icon,
                color: task.category.color.withOpacity(iconOpacity),
              ),
            ),
          ),
          const Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(task.title),
                Text(task.time),
              ],
            ),
          ),
          Checkbox(
            value: task.isCompleted,
            onChanged: (value) {},
          ),
        ],
      ),
    );;
  }
}
