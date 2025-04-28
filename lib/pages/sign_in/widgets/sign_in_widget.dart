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
    margin: EdgeInsets.only(left: 150, right: 150, top: 20, bottom: 20),
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

Widget ReusableText(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 5),
    child: Text(
      text,
      style: TextStyle(
        color: Colors.grey.withOpacity(.5),
        fontWeight: FontWeight.normal,
        fontSize: 14,
      ),
    ),
  );
}

Widget buildTextField(String hintText, String textType, String iconName) {
  return Container(
    height: 50,
    width: 420,
    margin: EdgeInsets.only(bottom: 20),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        border: Border.all(color: Colors.black)),
    child: Row(
      children: [
        Container(
          width: 16,
          height: 16,
          margin: EdgeInsets.only(left: 17),
          child: Image.asset("assets/icons/$iconName.png"),
        ),
        SizedBox(
            height: 50,
            width: 370,
            child: TextField(
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                  hintText: hintText,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.transparent,
                  )),
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.transparent,
                  )),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  hintStyle: TextStyle(color: Colors.grey.withOpacity(.5))),
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Avenir",
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ),
              autocorrect: false,
              obscureText: textType == "password" ? true : false,
            ))
      ],
    ),
  );
}

Widget forgetPassword() {
  return Container(
    height: 44,
    width: 260,
    margin: EdgeInsets.only(left: 18),
    child: GestureDetector(
      onTap: () {},
      child: Text(
        "Forget password?",
        style: TextStyle(
          color: Colors.black,
          decoration: TextDecoration.underline,
          decorationColor: Colors.blue,
          fontSize: 15,
        ),
      ),
    ),
  );
}

Widget buildLogInButton(String buttonName, String buttonType) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      height: 50,
      width: 420,
      margin: EdgeInsets.only(top: buttonType=="login"?40:20),
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 1),
                color: Colors.grey.withOpacity(.5))
          ]),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
        ),
      ),
    ),
  );
}
