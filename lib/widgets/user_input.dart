import 'package:flutter/material.dart';
import 'package:todo/model/todo_model.dart';

class UserInput extends StatelessWidget {
  var textcontroller = TextEditingController();
  final Function insertFunction;  
  UserInput({required this.insertFunction, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5,vertical: 8),
      child: Row(
         children: [
          Expanded(child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: TextField(
              controller: textcontroller,
              decoration: InputDecoration(
                hintText: 'What\'s your task ?', 
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 212, 164, 6), width: 2))
              ),
            ))),
          SizedBox(width: 10),
          GestureDetector(
            onTap: (){
              var myTodo = Todo(title: textcontroller.text, creationDate: DateTime.now(), isChecked: false);
              insertFunction(myTodo);
            },
            child: Container(
              color: Color.fromARGB(255, 212, 164, 6),
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              child: Text('Add',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),)
            ) 
            )
         ],
      ),
    );
  }
}