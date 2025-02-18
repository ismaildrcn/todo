import 'package:flutter/material.dart';
import 'package:todo/constants/task_type.dart';
import 'package:todo/model/task.dart';

class TodoItem extends StatefulWidget {
  const TodoItem({super.key, required this.task});
  final Task task;

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.task.isCompleted ? Colors.grey : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            widget.task.type == TaskType.note
                ? Image.asset("lib/assets/images/category_1.png")
                : widget.task.type == TaskType.contest
                    ? Image.asset("lib/assets/images/category_3.png")
                    : Image.asset("lib/assets/images/category_2.png"),
            Expanded(
              child: Column(
                children: [
                  Text(
                    widget.task.title,
                    style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        decoration: widget.task.isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  ),
                  Text(
                    widget.task.description,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[850],
                        decoration: widget.task.isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  )
                ],
              ),
            ),
            Checkbox(
              value: isChecked,
              onChanged: (val) => {
                setState(
                  () {
                    widget.task.isCompleted = !widget.task.isCompleted;
                    isChecked = val!;
                  },
                )
              },
            ),
          ],
        ),
      ),
    );
  }
}
