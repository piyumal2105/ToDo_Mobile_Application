import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'App/todo_app.dart';

void main() {
  runApp(
    ProviderScope(
      child: DevicePreview(
        builder: (context) => ToDoApp(), // Wrap your app
      ),
    ),
  );
}
