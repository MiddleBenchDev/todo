import 'package:flutter/material.dart';
import 'package:todo/model/db_model.dart';
import 'package:todo/widgets/todo_card.dart';

class TodoList extends StatelessWidget {
  var db = DatabaseConnect();
  final Function insertFunction;
  final Function deleteFunction;
  TodoList({required this.insertFunction, required this.deleteFunction,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Expanded(
      child:  FutureBuilder(
        future: db.getTodo(),
        initialData: [],
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          var data = snapshot.data;
          var datalength = data!.length;

          return datalength == 0 ? Center(child: Text('No Tasks Added', style: TextStyle(fontSize: 24, color: Color.fromARGB(255, 212, 164, 6),))) : ListView.builder(
            itemCount: datalength,
            itemBuilder: (context, i) => TodoCard(
              id: data[i].id,
              title: data[i].title,
              creationDate: data[i].creationDate,
              isChecked: data[i].isChecked,
              insertFunction: insertFunction,
              deleteFunction: deleteFunction
            )
          );
        },
       ),
      );
  }
}