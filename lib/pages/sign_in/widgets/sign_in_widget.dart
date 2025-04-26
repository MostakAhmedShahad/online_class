import 'dart:ui';

import 'package:flutter/material.dart';

AppBar buildAppBar(){

  return  AppBar(
          bottom: PreferredSize(preferredSize: const Size.fromHeight(1), child: Container(
            color: Colors.grey.withOpacity(.5),
            height: 1,
          )),
          title: Center(
            child: Text('Log In',style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.normal,
            ),),
          ),
        );
}

Widget ThirdPartLogIn(BuildContext context){
  return Container(
    child: Row(
      children: [
        GestureDetector(
          onTap: () {
            
          },
          child: Image.asset("assets/icons/google.png"),

        ),
         

      ],
    ),


  );
}