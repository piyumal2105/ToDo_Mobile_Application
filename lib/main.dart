import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

import 'App/todo_app.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}
