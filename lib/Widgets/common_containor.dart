import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_app/Utils/extentions.dart';

class CommonContainor extends StatelessWidget {
  const CommonContainor({super.key, this.child, this.height});

  final Widget? child;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final deviceSize = context.deviceSize;
    return Container(
      height: height,
      width: deviceSize.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: context.colorScheme.primaryContainer,
      ),
      child: child,
    );
  }
}
