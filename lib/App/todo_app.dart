import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:todo_app/Config/config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/Config/routes/route.dart';
import '../Config/theme/app_theme.dart';

class ToDoApp extends ConsumerWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routeConfig = ref.watch(routesProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: AppTheme.light,
      title: 'ToDo',
      routerConfig: routeConfig,
    );
  }
}