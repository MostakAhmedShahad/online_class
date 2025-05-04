import 'package:flutter/material.dart';
import 'package:online_class/pages/sign_in/widgets/sign_in_widget.dart';

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
        appBar: buildAppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ThirdPartLogIn(context),
              Center(child: ReusableText("Or use your email to login!")),
              Container(
                margin: EdgeInsets.only(top: 68),
                padding: EdgeInsets.only(left: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  
                  children: [

                     ReusableText("Email"),
                     SizedBox(height: 5,),
                     buildTextField("Enter your email address","email", "user"),
                     ReusableText("Password"),
                     SizedBox(height: 5,),
                     buildTextField("Enter your password","password", "lock"),
                     forgetPassword(),
                      buildLogInButton("Login", "login"),
                      buildLogInButton("Register", "register"),

                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}