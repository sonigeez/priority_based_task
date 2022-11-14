import 'package:flutter/material.dart';
import 'package:priority/todo.dart';
import 'package:priority/todo_provider.dart';
import 'package:provider/provider.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  TextEditingController todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    dynamic dropDownValue;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            title: const Text("Add Your todo")),
        body: Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 7,
              right: MediaQuery.of(context).size.width / 8,
              left: MediaQuery.of(context).size.width / 8),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            TextField(
              controller: todoController,
              decoration: const InputDecoration(
                labelText: "Enter your todo",
              ),
            ),
            DropdownButtonFormField<String>(
              value: dropDownValue,
              decoration: const InputDecoration(
                labelText: 'Tag',
              ),
              items: <String>[
                'Urgent And Important',
                'Not Urgent But Important',
                'Urgent But Not Important',
                'Not Urgent Not Important'
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                dropDownValue = value;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Builder(builder: (BuildContext newContext) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey, // Background color
                  ),
                  onPressed: () async {
                    if (dropDownValue != null && todoController.text != "") {
                      final newTodo =
                          Todo(label: dropDownValue, todo: todoController.text);
                      newTodo.todo = todoController.text;
                      newTodo.label = dropDownValue;
                      newContext.read<TodosProvider>().addTodo(newTodo);
                      Navigator.pop(context);
                    }
                  },
                  child: const Text(
                    "Add",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                );
              }),
            )
          ]),
        ),
      ),
    );
  }
}
