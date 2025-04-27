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
    margin: EdgeInsets.only(left: 150,right: 150,top: 20,bottom: 20),
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

Widget ReusableText(String text){

  return Container(

    margin: EdgeInsets.only(bottom: 5),
    child: Text(text, style: TextStyle(
      color: Colors.grey.withOpacity(.5),
      fontWeight: FontWeight.normal,
      fontSize: 14,
    ),),

  );
}

Widget buildTextField (String text, String textType ){
  return Container(
    height:50 ,
    width: 420,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(16))
    ),
     child: Row(
      children: [
        Container(
          width: 16,
          height: 16,
          margin: EdgeInsets.only(left: 17),
          child: Image.asset("assets/icons/user.png"),
        ),
        SizedBox(
          height:50 ,
          width: 370,
          child: TextField(
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
              hintText: "Input your email..",
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent
                )
              )
            ),
          ),
          
        )
      ],
     ),

  );

}