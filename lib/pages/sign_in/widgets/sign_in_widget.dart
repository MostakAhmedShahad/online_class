import 'dart:ui';

import 'package:flutter/material.dart';

AppBar buildAppBar() {
  return AppBar(
    bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          color: Colors.grey.withOpacity(.5),
          height: 1,
        )),
    title: Center(
      child: Text(
        'Log In',
        style: TextStyle(
          color: Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.normal,
        ),
      ),
    ),
  );
}

Widget ThirdPartLogIn(BuildContext context) {
  return Container(
    margin: EdgeInsets.all(40),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _reUsableIcons("google"),
        _reUsableIcons("apple"),
        _reUsableIcons("facebook"),
      ],
    ),
  );
}

Widget _reUsableIcons(String iconName) {
  return GestureDetector(
      onTap: () {},
      child: SizedBox(
        height: 40,
        width: 40,
        child: Image.asset("assets/icons/$iconName.png"),
      ));
}

Widget ReusableText(){

  return Container(

  );
}