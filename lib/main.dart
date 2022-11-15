import 'package:flutter/material.dart';
import 'package:priority/services/todo_provider.dart';
import 'package:provider/provider.dart';
import 'Views/add_todo.dart';
import 'Views/widgets/custom_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => TodosProvider(),
        child: MaterialApp(
          theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Roboto'),
          home: const SafeArea(child: HomePage()),
        ));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Center(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.brown.withOpacity(0.42)),
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              heroTag: "button",
              elevation: 30,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddTodo()),
                );
              },
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 29,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                const CustomCard(
                  color: Colors.red,
                  label: "Urgent And Important",
                  margin: EdgeInsets.only(right: 1, bottom: 1),
                ),
                CustomCard(
                  color: Colors.yellow.shade400,
                  label: "Not Urgent But Important",
                  margin: const EdgeInsets.only(left: 1, bottom: 1),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: const [
                CustomCard(
                  color: Colors.green,
                  label: "Urgent But Not Important",
                  margin: EdgeInsets.only(right: 1, top: 1),
                ),
                CustomCard(
                  color: Colors.blueAccent,
                  label: "Not Urgent Not Important",
                  margin: EdgeInsets.only(left: 1, top: 1),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
