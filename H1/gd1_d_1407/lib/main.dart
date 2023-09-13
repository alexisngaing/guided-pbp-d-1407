import 'package:flutter/material.dart';
import 'package:gd1_d_1407/showProfile.dart';
import 'package:gd1_d_1407/isiLinkTree.dart';
import 'package:gd1_d_1407/isiLogo.dart';
import 'package:gd1_d_1407/utilities/constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 228, 105, 132),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ShowProfile()),
                      );
                    },
                    child: const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('images/billie-pfp.jpg'),
                    ),
                  ),
                  const Text(
                    'Billie Eilish',
                    style: kTextStyle1,
                  ),
                  const Text(
                    'Singer',
                    style: kTextStyle2,
                  ),
                  kSizeBox,
                  const IsiLinkTree(),
                  kSizeBox,
                  const IsiLogo(),
                ],
              ),
            )));
  }
}
