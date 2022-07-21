import 'package:flutter/material.dart';
import 'package:todo/model/todo_model.dart';

class TodoCard extends StatefulWidget {
  final int id;
  final String title;
  final DateTime creationDate;
  bool isChecked;

  final Function insertFunction;
  final Function deleteFunction;
  TodoCard({required this.id, required this.title, required this.creationDate, required this.isChecked, required this.insertFunction, required this.deleteFunction,Key? key}) : super(key: key);

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  @override
  Widget build(BuildContext context) {
    var anotherTodo = Todo(id: widget.id, title: widget.title, creationDate: widget.creationDate, isChecked: widget.isChecked);
    return Card(
      child: Row(
        children: [
           Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Checkbox(
              value: widget.isChecked,
              onChanged: (bool ? value) {
                setState(() {
                  widget.isChecked = value!;
                });
                anotherTodo.isChecked = value!;
                widget.insertFunction(anotherTodo);
              },
            ),
           ),
           Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),),
              SizedBox(height: 5),
              Text(widget.creationDate.toString(),
              style: TextStyle(
                color: Color(0xFF8F8F8F),
                fontWeight: FontWeight.bold,
                fontSize: 16
              ),)
            ],
           )),
           IconButton(onPressed: () {
            widget.deleteFunction(anotherTodo);
           }, 
           icon: Icon(Icons.delete_forever, color: Colors.red))
        ],
      ),
    );
  }
}