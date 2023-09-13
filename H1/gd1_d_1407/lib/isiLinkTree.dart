import 'package:flutter/material.dart';
import 'package:gd1_d_1407/elementLinkTree.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gd1_d_1407/service/directToLink.dart';

class IsiLinkTree extends StatefulWidget {
  const IsiLinkTree({super.key});

  @override
  State<IsiLinkTree> createState() => _IsiLinkTreeState();
}

class _IsiLinkTreeState extends State<IsiLinkTree> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardForlinkTree(
          text: '+91 123 456 789',
          icon: Icons.phone,
        ),
        const CardForlinkTree(
          text: 'billie@gmail.com',
          icon: Icons.email,
        ),
        CardForlinkTree(
          text: 'Instagram',
          icon: FontAwesomeIcons.instagram,
          onPressed: () {
            Direct.launchThisURL('https://www.instagram.com/billieeilish/');
          },
        ),
        CardForlinkTree(
          text: 'Facebook',
          icon: FontAwesomeIcons.facebook,
          onPressed: () {
            Direct.launchThisURL('https://www.facebook.com/');
          },
        ),
      ],
    );
  }
}
