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
          child: Stack(
            children: [
              PageView(
                children: [
                  
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget  _page(){
    return Column(
      children: [
        LayoutBuilder(
                    builder: (context, constraints) {
                      // Get the screen width and height
                      final screenWidth = constraints.maxWidth;
                      final screenHeight = constraints.maxHeight;

                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: screenHeight *
                                  0.4, // e.g., 40% of screen height
                              width:
                                  screenWidth * 0.8, // e.g., 80% of screen width
                              child: Text('image one'),
                            ),
                            Container(
                              child: Text(
                                'First see learning',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize:
                                      screenWidth * 0.06, // responsive font size
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(screenWidth * 0.03),
                              child: Text(
                                'Forget about a for of paper all knowledge in learning',
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                  fontSize:
                                      screenWidth * 0.035, // responsive font size
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            SizedBox(height: 80,),
                            Container(
                             // padding: EdgeInsets.all(screenWidth * 0.05),
                              height: screenHeight * 0.08,
                              width: screenWidth * 0.85,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(.5),
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                    offset: Offset(0, 1),
                                  )
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  'Next',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.04, // responsive
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  )
      ],

    );
  }
}
