import 'package:flutter/material.dart';
import 'package:priority/todo_provider.dart';
import 'package:provider/provider.dart';
import 'add_todo.dart';
import 'custom_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => TodosProvider(),
        child: const MaterialApp(
          home: SafeArea(child: HomePage()),
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
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddTodo()),
            );
          },
          child: Hero(
            tag: "button",
            child: Material(
              type: MaterialType.transparency,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 2, color: Colors.brown.withOpacity(0.42)),
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: Colors.blueAccent.withOpacity(0.2)),
                      color: Colors.blueGrey,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 29,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: const [
                CustomCard(
                  color: Color(0xff16B0A4),
                  label: "Urgent And Important",
                  margin: EdgeInsets.only(right: 1, bottom: 1),
                ),
                CustomCard(
                  color: Color(0xffB5CE3B),
                  label: "Not Urgent But Important",
                  margin: EdgeInsets.only(left: 1, bottom: 1),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: const [
                CustomCard(
                  color: Color(0xffDE177B),
                  label: "Urgent But Not Important",
                  margin: EdgeInsets.only(right: 1, top: 1),
                ),
                CustomCard(
                  color: Color(0xffE85624),
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
