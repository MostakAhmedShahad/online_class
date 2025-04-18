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
                      child: Text('image onw'),
                    ),

                    Container(
                      child: Text('First see learnign',style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.normal
                      ),),
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