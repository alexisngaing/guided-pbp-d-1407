import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gd5_d_1407/database/sql_helper.dart';
import 'package:gd5_d_1407/entity/employee.dart';
import 'package:gd5_d_1407/input_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQFLITE',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'SQFLITE'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> employee = [];

  void refresh() async {
    final data = await SQLHelper.getEmployee();
    setState(() {
      employee = data;
    });
  }

  @override
  void initState() {
    refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EMPLOYEE"),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const InputPage(
                            title: "Input Employee",
                            id: null,
                            name: null,
                            email: null,
                          )),
                ).then((_) => refresh());
              }),
          IconButton(icon: Icon(Icons.clear), onPressed: () async {})
        ],
      ),
      body: ListView.builder(
        itemCount: employee.length,
        itemBuilder: (context, index) {
          return Slidable(
            child: ListTile(
              title: Text(employee[index]['name']),
              subtitle: Text(employee[index]['email']),
            ),
            actionPane: SlidableDrawerActionPane(),
            secondaryActions: [
              IconSlideAction(
                caption: 'Update',
                color: Colors.blue,
                icon: Icons.update,
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InputPage(
                          title: 'Input Employee',
                          id: employee[index]['id'],
                          name: employee[index]['name'],
                          email: employee[index]['email']),
                    ),
                  ).then((_) => refresh());
                },
              ),
              IconSlideAction(
                caption: 'Delete',
                color: Colors.red,
                icon: Icons.delete,
                onTap: () async {
                  await deleteEmployee(employee[index]['id']);
                },
              )
            ],
          );
        },
      ),
    );
  }

  Future<void> deleteEmployee(int id) async {
    await SQLHelper.deleteEmployee(id);
    refresh();
  }
}
