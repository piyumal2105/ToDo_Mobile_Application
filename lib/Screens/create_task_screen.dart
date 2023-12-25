import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/Widgets/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreateTaskScreen extends StatelessWidget {
  static CreateTaskScreen builder(BuildContext context, GoRouterState state) => const CreateTaskScreen();
  const CreateTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const DisplayWhiteText(
          text: "Add New Task",
        ),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CommonTextField(
                title: "Task Title",
                hintText: "Task Title"
            ),
            const Gap(16),
            const SelectDateTime(),
            const Gap(16),
            const CommonTextField(
              title: "Note",
              hintText: "Task Note",
              maxLines: 6,
            ),
            const Gap(60),
            ElevatedButton(
              onPressed: () {},
              child: const DisplayWhiteText(text: "Save"),
            )
          ],
        ),
      ),
    );
  }
}
