import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mamaimakhrap/CoursePage.dart';

class InCoursePage extends StatefulWidget {
  const InCoursePage({super.key});

  @override
  State<InCoursePage> createState() => _InCoursePageState();
}

class _InCoursePageState extends State<InCoursePage> {
  double screenHeight = 0;
  double screenWidth = 0;
  Color primary = const Color.fromARGB(255, 255, 255, 255);
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 188, 153),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          SizedBox(
              height: 100,
              width: screenWidth,
              child: Container(
                margin: const EdgeInsets.only(top: 40),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(left: 10, bottom: 4),
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop((context));
                          },
                          icon: const Icon(
                            Icons.arrow_circle_left_rounded,
                            size: 40,
                            color: Color.fromARGB(255, 56, 56, 154),
                          )),
                    ),
                    const Expanded(
                        child: Padding(
                      padding: EdgeInsets.only(right: 40),
                      child: Text(
                        "Course",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 5, 47, 109)),
                      ),
                    ))
                  ],
                ),
              )),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0))),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.bottomCenter,
                    margin:
                        const EdgeInsets.only(top: 10, right: 10, bottom: 20),
                  ),
                  Container(
                    margin: EdgeInsets.all(15.0),
                    child: SizedBox(
                      child: Column(
                        children: const <Widget>[
                          ListTile(
                            title: Text(
                              'CSC234',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 56, 56, 154),
                              ),
                            ),
                            subtitle: Text('User-Centered Mobile Application'),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(15.0),
                    child: SizedBox(
                      child: Column(
                        children: const <Widget>[
                          ListTile(
                            title: Text(
                              'Member',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 56, 56, 154),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: screenWidth - 40,
                    width: screenWidth - 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromARGB(255, 236, 242, 255),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          customMember('Nawat Sujjaritrat'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  Widget customMember(
    String hint,
    //String date,
  ) {
    return Column(
      children: [
        Container(
          width: screenWidth - 40,
          margin: const EdgeInsets.only(bottom: 10),
          child: Card(
            margin: const EdgeInsets.all(20),
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Color.fromARGB(255, 236, 242, 255),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      title: const Text(
                        'Action',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 5, 47, 109)),
                      ),
                      actions: <Widget>[
                        Column(
                          children: [
                            Container(
                              color: Colors.white,
                              child: InkWell(
                                onTap: () {},
                                child: ListTile(
                                  leading: Icon(Icons.feedback),
                                  title: Text(
                                    "Feedback",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              color: Colors.white,
                              child: InkWell(
                                onTap: () {},
                                child: ListTile(
                                  leading: Icon(
                                    Icons.block,
                                    color: Colors.red,
                                  ),
                                  title: Text(
                                    "Kick",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      radius: 23,
                      backgroundImage: AssetImage("images/face.jpeg"),
                    ),
                    title: Text(
                      hint,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
