import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/Providers/providers.dart';
import 'package:todo_app/Utils/app_alerts.dart';
import 'package:todo_app/Utils/extentions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/Data/data.dart';
import 'widgets.dart';

class DisplayListOfTask extends ConsumerWidget {
  const DisplayListOfTask({
    super.key,
    required this.tasks,
    this.isCompletedTasks = false,
  });

  final List<Task> tasks;
  final bool isCompletedTasks;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceSize = context.deviceSize;
    final height = isCompletedTasks? deviceSize.height * 0.25 : deviceSize.height * 0.3;
    final emptyTaskMessage = isCompletedTasks ? "There is no completed task yet" : "There is no task todo!";

    return CommonContainor(
      height: height,
      child: tasks.isEmpty? Center(
        child: Text(
            emptyTaskMessage,
          style: context.textTheme.headlineMedium,
        ),
      ) :
      ListView.separated(
          shrinkWrap: true,
          itemCount: tasks.length,
          padding: EdgeInsets.zero,
          itemBuilder: (ctx, index) {
            final task = tasks[index];
            return InkWell(
              onLongPress: () {
                AppAlerts.showDeleteAlertDialog(context, ref, task);
              },
              onTap: () async {
                await showModalBottomSheet(
                    context: context,
                  builder: (ctx) {
                      return TaskDetails(
                        task: task
                      );
                  }
                );
              },
              child: TaskTile(
                  task: task,
                  onCompleted: (value) async {
                    await ref.read(taskProvoder.notifier).updateTask(task).then((value) => {
                      AppAlerts.displaySnackBar(context,
                          task.isCompleted ? "Task Incompleted" : "Task Completed"
                      )
                    });
              }),
            );
          },
        separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              thickness: 2.0,
            );
        },
      ),
    );
  }
}
