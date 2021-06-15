import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task/task_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ),
  );
  runApp(TaskApp());
}
