import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gd6_d_1407/entity/employee.dart';
import 'package:gd6_d_1407/input_page.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(
        title: 'Firebase',
      ),
      debugShowCheckedModeBanner: false,
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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Employee"),
          actions: [
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const InputPage(
                          title: 'Input Employee',
                          id: null,
                          name: null,
                          email: null,
                        ),
                      ));
                }),
            IconButton(icon: Icon(Icons.clear), onPressed: () async {})
          ],
        ),
        body: StreamBuilder(
            stream: getEmployee(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                Center(child: Text("Something went wrong"));
              }
              if (snapshot.hasData) {
                final employees = snapshot.data!;
                return ListView(
                  children: employees.map(buildEmployee).toList(),
                );
              } else {
                return Center(child: Text('No Data'));
              }
            }));
  }

  Widget buildEmployee(Employee employee) => Slidable(
        child: ListTile(
          title: Text(employee.name),
          subtitle: Text(employee.email),
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
                          id: employee.id,
                          name: employee.name,
                          email: employee.email,
                        )),
              );
            },
          ),
          IconSlideAction(
            caption: 'Delete',
            color: Colors.red,
            icon: Icons.delete,
            onTap: () async {
              final docEmployee = FirebaseFirestore.instance
                  .collection('employee')
                  .doc(employee.id);
              docEmployee.delete();
            },
          )
        ],
      );

  Stream<List<Employee>> getEmployee() => FirebaseFirestore.instance
      .collection('employee')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Employee.fromJson(doc.data())).toList());
}
