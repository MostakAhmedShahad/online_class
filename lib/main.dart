import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_class/pages/mini_game/mini_game.dart';
import 'package:online_class/pages/my_home_page/my_home_page.dart';
import 'package:online_class/pages/sign_in/sign_in.dart';
import 'package:online_class/pages/welcome/bloc/welcome_bloc.dart';
import 'package:online_class/pages/welcome/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
 



// Future <void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//    // options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(const MyApp());
// }
void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WelcomeBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Welcome(),
        routes: {
          "myHomePage":(context)=> const MyHomePage(),
          "signIn":(context)=> const SignIn(),
        },
      ),
    );
  }
}
