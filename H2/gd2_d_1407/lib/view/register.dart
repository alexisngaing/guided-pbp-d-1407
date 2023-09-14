import 'package:flutter/material.dart';
import 'package:gd2_d_1407/view/login.dart';
import 'package:gd2_d_1407/component/form_component.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController notelpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              inputForm((p0) {
                if (p0 == null || p0.isEmpty) {
                  return 'Username tidak boleh kosong';
                }
                if (p0.toLowerCase() == 'anjing') {
                  return 'Tidak boleh menggunakan kata kasar';
                }
                return null;
              },
                  controller: usernameController,
                  hinTxt: 'Username',
                  helperTxt: 'Tok Dalang',
                  iconData: Icons.person),
              inputForm(((p0) {
                if (p0 == null || p0.isEmpty) {
                  return 'Email tidak boleh kosong';
                }
                if (!p0.contains('@')) {
                  return 'Email tidak valid';
                }
                return null;
              }),
                  controller: emailController,
                  hinTxt: 'Email',
                  helperTxt: 'tokdalang@gmail.com',
                  iconData: Icons.email),
              inputForm(((p0) {
                if (p0 == null || p0.isEmpty) {
                  return 'Password tidak boleh kosong';
                }
                if (p0.length < 5) {
                  return 'Password minimal 5 karakter';
                }
                return null;
              }),
                  controller: passwordController,
                  hinTxt: 'Password',
                  helperTxt: 'xxxxxxx',
                  iconData: Icons.password,
                  password: true),
              inputForm(((p0) {
                if (p0 == null || p0.isEmpty) {
                  return 'No Telp tidak boleh kosong';
                }
                return null;
              }),
                  controller: notelpController,
                  hinTxt: 'No Telp',
                  helperTxt: '08123456789',
                  iconData: Icons.phone_android),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Map<String, dynamic> formData = {};
                      formData['username'] = usernameController.text;
                      formData['password'] = passwordController.text;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => LoginView(
                                    data: formData,
                                  )));
                    }
                  },
                  child: const Text('Register')),
            ],
          ),
        ),
      ),
    );
  }
}
