import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasks_flutter/controllers/task.controller.dart';
import 'package:tasks_flutter/utils/theme.utils.dart';
import 'package:tasks_flutter/views/task.views.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tasks',
      theme: ThemeData(
        primarySwatch: blueColor,
      ),
      initialBinding: BindingsBuilder(() => Get.lazyPut(() => TaskController())),
      home: const TaskListView(),
    );
  }
}
