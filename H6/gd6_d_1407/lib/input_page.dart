import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gd6_d_1407/entity/employee.dart';

class InputPage extends StatefulWidget {
  const InputPage(
      {super.key,
      required this.title,
      required this.id,
      required this.name,
      required this.email});

  final String? title, id, name, email;

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (widget.id != null) {
      nameController.text = widget.name!;
      emailController.text = widget.email!;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Input Employee"),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Name',
            ),
          ),
          SizedBox(height: 24),
          TextField(
            controller: emailController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Email',
            ),
          ),
          SizedBox(height: 48),
          ElevatedButton(
            child: Text('Save'),
            onPressed: () async {
              if (widget.id == null) {
                createEmployee(
                    name: nameController.text, email: emailController.text);
              } else {
                final docEmployee = FirebaseFirestore.instance
                    .collection('employees')
                    .doc(widget.id);
                docEmployee.update({
                  'name': nameController.text,
                  'email': emailController.text,
                });
              }
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }

  Future createEmployee({required String name, required String email}) async {
    final docEmployee = FirebaseFirestore.instance.collection('employee').doc();

    final employee = Employee(id: docEmployee.id, name: name, email: email);
    final json = employee.toJson();

    await docEmployee.set(json);
  }
}
