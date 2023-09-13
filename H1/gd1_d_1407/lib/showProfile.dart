import 'package:flutter/material.dart';
import 'package:gd1_d_1407/isiShowProfile.dart';
import 'package:gd1_d_1407/utilities/constant.dart';

class ShowProfile extends StatelessWidget {
  const ShowProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: kColor,
          body: Center(
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(top: 50),
                    child: Row(
                      children: [
                        kSizeBox2,
                        CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                AssetImage('images/billie-pfp.jpg')),
                        kSizeBox2,
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Billie Eilish',
                                style: kTextStyle4,
                              ),
                              Text(
                                'Singer',
                                style: kTextStyle5,
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Text(
                              '815',
                              style: kTextStyle3,
                            ),
                            Text(
                              'Posts',
                              style: kTextStyle3,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Text(
                              '111 M',
                              style: kTextStyle3,
                            ),
                            Text(
                              'Followers',
                              style: kTextStyle3,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Text(
                              '59',
                              style: kTextStyle3,
                            ),
                            Text(
                              'Following',
                              style: kTextStyle3,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                kSizeBox,
                IsiShowProfile()
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back),
            backgroundColor: Colors.teal,
          )),
    );
  }
}
