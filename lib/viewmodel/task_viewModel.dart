import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_app_provider/model/task_model.dart';

class TaskViewModel extends ChangeNotifier {
  List<Task> tasks = [];
  String? taskName;
  final dateController = TextEditingController();
  final timeController = TextEditingController();

  bool get isValid =>
      taskName != null &&
      dateController.text.isNotEmpty &&
      timeController.text.isNotEmpty;

  setTaskName(String value) {
    taskName = value;
    notifyListeners();
  }

  setTaskDate(DateTime? date) {
    if (date == null) return;

    DateTime currentDate = DateTime.now();
    DateTime now =
        DateTime(currentDate.year, currentDate.month, currentDate.day);

    int diff = date.difference(now).inDays;

    if (diff == 0) {
      dateController.text = "Today";
    } else if (diff == 1) {
      dateController.text = "Tomorrow";
    } else {
      dateController.text = "${date.day}/${date.month}/${date.year}";
    }
    notifyListeners();
  }

  setTaskTime(TimeOfDay? time) {
    if (time == null) return;
    if (time.hour == 0) {
      timeController.text = "12:${time.minute} AM";
    } else if (time.hour < 12) {
      timeController.text = "${time.hour}:${time.minute} AM";
    } else if (time.hour == 12) {
      timeController.text = "${time.hour}:${time.minute} PM";
    } else {
      timeController.text = "${time.hour - 12}:${time.minute} PM";
    }
    notifyListeners();
  }

  addTask() {
    // if (isValid) {
    //   return;
    // }
    final task = Task(
        taskName: taskName!,
        date: dateController.text,
        time: timeController.text);
    tasks.add(task);
    timeController.clear();
    dateController.clear();
    notifyListeners();
  }
}
