import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: Container(
          // width: 375.w,
          child: Stack(
            children: [
              PageView(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 360,
                        width: 360,
                        child: Text('image one'),
                      ),
                      Container(
                        child: Text(
                          'First see learning',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          'Forget about a for of paper all knowledge in learning',
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 14,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        height: 50,
                        width: 325,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(.5),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: Offset(0, 1))
                            ]),
                        child: Center(
                          child: Text(
                            'Next',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
