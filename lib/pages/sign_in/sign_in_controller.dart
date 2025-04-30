import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_class/main.dart';
import 'package:online_class/pages/sign_in/bloc/sign_in_bloc.dart';

class SignInController {
  final BuildContext context;
  const SignInController({required this.context});
  Future<void> hanldeSingIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {}
        if (password.isEmpty) {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
                  if(credential.user==null){

                  }
                  if(!credential.user!.emailVerified){

                  }
                  var user =credential.user;
                  if(user!=null){

                  }
                  else{
                    
                  }
        }

        try {} catch (e) {}
      }
    } catch (e) {}
  }
}
