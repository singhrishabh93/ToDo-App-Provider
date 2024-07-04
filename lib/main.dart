import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_provider/screen/task_screen.dart';
import 'package:todo_app_provider/viewmodel/task_viewModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ToDo App',
        home: TaskScreen()
      ),
    );
  }
}

