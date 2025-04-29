import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_class/main.dart';
import 'package:online_class/pages/sign_in/bloc/sign_in_bloc.dart';

class SignInController {
  final BuildContext context;
  const SignInController({required this.context});
  void hanldeSingIn(String type){
    try{
      if(type=="email"){
        final state= context.read<SignInBloc>().state;
        String emailAddress=state.email;
        String password=state.password;
        if(emailAddress.isEmpty){

        }
        if(password.isEmpty){
          
        }
      }
    }
    catch(e){
      
    }


  }
}