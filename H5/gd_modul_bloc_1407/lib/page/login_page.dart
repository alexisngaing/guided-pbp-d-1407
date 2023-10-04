import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/form_submission_state.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.formSubmissionState is SubmissionSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Login Success"),
              ),
            );
          }
          if (state.formSubmissionState is SubmissionFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text((state.formSubmissionState as SubmissionFailed)
                      .exception
                      .toString()) // Exception
                  ),
            );
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) => SafeArea(
            child: Scaffold(
              body: Form(
                key: formKey,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: usernameController,
                        decoration: const InputDecoration(
                          prefix: Icon(Icons.person),
                          labelText: 'Username',
                        ),
                        validator: (value) =>
                            value!.isEmpty ? 'Username is empty' : null,
                      ),
                      TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          prefix: const Icon(Icons.lock),
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              state.isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: state.isPasswordVisible
                                  ? Colors.grey
                                  : Colors.blue,
                            ),
                            onPressed: () {
                              setState(() {
                                BlocProvider.of<LoginBloc>(context)
                                    .add(IsPasswordVisibleChanged());
                              });
                            },
                          ),
                        ),
                        obscureText: !state.isPasswordVisible,
                        validator: (value) =>
                            value!.isEmpty ? 'Password is empty' : null,
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<LoginBloc>(context)
                                  .add(FormSubmitted(
                                username: usernameController.text,
                                password: passwordController.text,
                              ));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                          ),
                          child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: state.formSubmissionState is FormSubmitting
                                  ? const CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.white),
                                    )
                                  : const Text('Login')),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
