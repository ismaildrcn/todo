import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/constants/task_type.dart';
import 'package:todo/header.dart';
import 'package:todo/model/task.dart';
import 'package:todo/screens/new_task.dart';
import 'package:todo/todoItem.dart';

// List<String> todo = ["Study Lessons", "Run SK", "Got to party"];
// List<String> todoCompleted = ["Game meetup", "Take out tash"];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> todo = [
    Task(
        type: TaskType.note,
        title: "Study Lessons",
        description: "Study Comp117",
        isCompleted: false),
    Task(
        type: TaskType.contest,
        title: "Run SK",
        description: "Run 5 kilometers",
        isCompleted: false),
    Task(
        type: TaskType.calender,
        title: "Go to party",
        description: "Atent to party",
        isCompleted: false),
  ];

  List<Task> completed = [
    Task(
        type: TaskType.contest,
        title: "Run SK",
        description: "Run 5 kilometers",
        isCompleted: false),
    Task(
        type: TaskType.calender,
        title: "Go to party",
        description: "Atent to party",
        isCompleted: false),
  ];

  void addNewTask(Task newTask) {
    setState(() {
      todo.add(newTask);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: HexColor(backgroundColor),
          body: Column(children: [
            // Header content
            Header(),
            // Doing Task content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: SingleChildScrollView(
                  child: ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: todo.length,
                      itemBuilder: (context, index) {
                        return TodoItem(
                          task: todo[index],
                        );
                      }),
                ),
              ),
            ),

            // Completed Task content
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Completed",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: SingleChildScrollView(
                    child: ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: completed.length,
                  itemBuilder: (context, index) {
                    return TodoItem(task: completed[index]);
                  },
                )),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddNewTask(
                          addNewTask: (newTask) => addNewTask(newTask))));
                },
                child: Text("Add New Task"))
          ]),
        ),
      ),
    );
  }
}
