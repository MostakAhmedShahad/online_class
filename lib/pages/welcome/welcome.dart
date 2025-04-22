import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_class/pages/welcome/bloc/welcome_bloc.dart';
import 'package:online_class/pages/welcome/bloc/welcome_event.dart';
import 'package:online_class/pages/welcome/bloc/welcome_state.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WelcomeBloc, WelcomeState>(
      builder: (context, state) {
        return ScreenUtilInit(
          designSize: const Size(360, 690),
          builder: (context, child) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: SafeArea(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    PageView(
                      controller: pageController,
                      onPageChanged: (index) {
                        state.page = index;
                        BlocProvider.of<WelcomeBloc>(context)
                            .add(WelcomeEvent());
                      },
                      children: [
                        _page(
                          context,
                          1,
                          "Next",
                          "First see learning",
                          "Forget about a for of paper all knowledge in learning",
                          "assets/images/reading.png",
                        ),
                        _page(
                          context,
                          2,
                          "Next",
                          "First see learning",
                          "Forget about a for of paper all knowledge in learning",
                          "assets/images/boy.png",
                        ),
                        _page(
                          context,
                          3,
                          "Get Started",
                          "First see learning",
                          "Forget about a for of paper all knowledge in learning",
                          "assets/images/man.png",
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 80.h,
                      child: DotsIndicator(
                        dotsCount: 3,
                        position: state.page.toDouble(),
                        mainAxisAlignment: MainAxisAlignment.center,
                        decorator: DotsDecorator(
                          color: Colors.grey,
                          activeColor: Colors.blue,
                          size: const Size.square(8),
                          activeSize: const Size(10, 8),
                          activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
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
              //color: Colors.grey.shade200,
              child: Center(
                child: Image.asset(imagePath),
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
            SizedBox(height: screenHeight * 0.1),
            GestureDetector(
              onTap: () {
                if (index < 3) {
                  pageController.animateToPage(index,
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.easeIn);
                } else {}
              },
              child: Container(
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
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
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
