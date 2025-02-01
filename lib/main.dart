import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/header.dart';
import 'package:todo/todoItem.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

List<String> todo = ["Study Lessons", "Run SK", "Got to party"];
List<String> todoCompleted = ["Game meetup", "Take out tash"];

class _MyAppState extends State<MyApp> {
  bool isChecked = false;

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
                          title: todo[index],
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
                  itemCount: todoCompleted.length,
                  itemBuilder: (context, index) {
                    return TodoItem(title: todoCompleted[index]);
                  },
                )),
              ),
            ),
            ElevatedButton(onPressed: () {}, child: Text("Add New Task"))
          ]),
        ),
      ),
    );
  }
}
