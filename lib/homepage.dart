import 'package:flutter/material.dart';
import 'package:todo/model/db_model.dart';
import 'package:todo/model/todo_model.dart';
import 'package:todo/widgets/user_input.dart';
import 'package:todo/widgets/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var db = DatabaseConnect();

  void additem(Todo todo) async{
    await db.insertTodo(todo);
    setState(() {
      
    });
  }

  void deleteitem(Todo todo) async{
    await db.deleteTodo(todo);
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 212, 164, 6),
        title: Text('ToDo'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TodoList(insertFunction: additem, deleteFunction: deleteitem),
          UserInput(insertFunction: additem)
        ],
      ),
    );
  }
}