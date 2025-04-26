import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return   Container(
      color: Colors.white,
      child: SafeArea(child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
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
        ),
      )),
    );
  }
}