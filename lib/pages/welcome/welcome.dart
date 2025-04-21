import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690), // You can adjust this base size
      builder: (context, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                PageView(
                  children: [
                    _page(
                        context,
                        1,
                        "Next",
                        "First see learning",
                        "Forget about a for of paper all knowledge in learning",
                        "image path"),
                    _page(
                        context,
                        2,
                        "Next",
                        "First see learning",
                        "Forget about a for of paper all knowledge in learning",
                        "image path"),
                    _page(
                        context,
                        3,
                        "Get Started",
                        "First see learning",
                        "Forget about a for of paper all knowledge in learning",
                        "image path"),
                  ],
                ),
                Positioned(
                  bottom: 100.h,
                    child: DotsIndicator(
                  dotsCount: 3,
                  mainAxisAlignment: MainAxisAlignment.center,
                ))
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _page(BuildContext context, int index, String buttonName,
      String tittle, String subtittle, String imagePath) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.1),
            Container(
              height: screenHeight * 0.35,
              width: screenWidth * 0.8,
              color: Colors.grey.shade200,
              child: const Center(
                child: Text(
                  'Image One',
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            Text(
              tittle,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: screenWidth * 0.06,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: screenHeight * 0.015),
            Text(
              subtittle,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: screenWidth * 0.04,
              ),
            ),
            SizedBox(height: screenHeight * 0.1), // Push button down
            Container(
              height: screenHeight * 0.07,
              width: screenWidth * 0.8,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  buttonName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize:
                        16, // You can use screenWidth * 0.04 for dynamic size
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
          ],
        ),
      ),
    );
  }
}
