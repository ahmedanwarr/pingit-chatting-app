import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pingit/screens/chat_screen.dart';
import 'package:pingit/screens/loading_screen.dart';
import 'package:pingit/screens/login_screen.dart';
import 'package:pingit/screens/welcome_screen.dart';
import 'package:pingit/screens/register_screen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  runApp(Pingit());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class Pingit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        // backgroundColor: Colors.orangeAccent,
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.black87),
        ),
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
        ChatScreen.id: (context) => ChatScreen(),
        LoadingScreen.id: (context) => LoadingScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
