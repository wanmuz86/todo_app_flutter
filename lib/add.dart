import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:todo_app/model/todo.dart';
class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final nameController = TextEditingController();
  final descController = TextEditingController();
  //final dateController = TextEditingController();
  String dateSelected = "";
  @override
  Widget build(BuildContext context) {
    final format = DateFormat("dd-MM-yyyy");
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new Item"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText: "Enter item name!"),
                controller: nameController,
              ),
              TextField(
                decoration:
                    InputDecoration(hintText: "Enter item description!"),
                controller: descController,
              ),

              DateTimeField(
                format: format,
                onChanged: (dt){
                  setState(() {
                  dateSelected = "${dt.day}/${dt.month}/${dt.year}";
                  });
                },
                onShowPicker: (context, currentValue) {
                  return showDatePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      initialDate: currentValue ?? DateTime.now(),
                      lastDate: DateTime(2100));
                },
              ),
              FlatButton(
                onPressed: () {
                  //Navigator.pop(context);
                  print("Name: ${nameController.text}, "
                      "description: ${descController.text},"
                      "date: $dateSelected");
                  Todo newTodo = Todo(nameController.text,descController.text,dateSelected);
                  Navigator.pop(context,newTodo);
                },
                child: Text("Save"),
                color: Colors.yellow,
              )
            ],
          ),
        ),
      ),
    );
  }
}
