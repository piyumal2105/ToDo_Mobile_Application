import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/Config/routes/route.dart';
import 'package:todo_app/Data/data.dart';
import 'package:todo_app/Utils/utils.dart';
import 'package:todo_app/Widgets/common_containor.dart';
import 'package:todo_app/Widgets/display_list_of_task.dart';
import 'package:todo_app/Widgets/display_white_text.dart';

class HomeScreen extends StatelessWidget {
  static HomeScreen builder(BuildContext context, GoRouterState state) => const HomeScreen();
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: deviceSize.height * 0.3,
                width: deviceSize.width,
                color: colors.primary,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DisplayWhiteText(
                      text: "Aug 7, 2023",
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                    DisplayWhiteText(
                      text: "My Todo List",
                      fontSize: 40,
                      fontWeight: FontWeight.normal,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 130,
            left: 0,
            right: 0,
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const DisplayListOfTask(
                      tasks: [
                        Task(
                            title: "title 01",
                            note: "",
                            time: "10.12",
                            date: "Aug, 7",
                            category: TaskCategories.shopping,
                            isCompleted: false,
                        ),
                        Task(
                            title: "title 02",
                            note: "note",
                            time: "13.12",
                            date: "Aug, 7",
                            category: TaskCategories.education,
                            isCompleted: false,
                        ),
                      ],
                    ),
                    const Gap(20),
                    Text(
                      "Completed",
                      style: context.textTheme.headlineMedium,
                    ),
                    const Gap(20),
                    const DisplayListOfTask(
                      tasks: [
                        Task(
                          title: "title 01",
                          note: "note",
                          time: "10.12",
                          date: "Aug, 7",
                          category: TaskCategories.personal,
                          isCompleted: true,
                        ),
                        Task(
                          title: "title 02",
                          note: "note",
                          time: "13.12",
                          date: "Aug, 7",
                          category: TaskCategories.work,
                          isCompleted: true,
                        ),
                      ],
                      isCompletedTasks: true,
                    ),
                    const Gap(20),
                    ElevatedButton(
                      onPressed: () => context.push(RouteLocation.createtask),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: DisplayWhiteText(text: "Add New Task"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
