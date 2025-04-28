import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_class/pages/sign_in/bloc/sign_in_event.dart';
import 'package:online_class/pages/sign_in/bloc/sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState()) {
    on<SignInEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}