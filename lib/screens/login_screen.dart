import 'package:flutter/material.dart';
import 'package:pingit/constants.dart';
import 'package:pingit/screens/chat_screen.dart';
import 'package:pingit/screens/loading_screen.dart';
import 'package:pingit/utilities/loginregister_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  late String userEmail;
  late String userPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: 'logo',
              child: Image(
                image: AssetImage('images/logo.png'),
                height: 110,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: TextField(
                textAlign: TextAlign.start,
                keyboardType: TextInputType.emailAddress,
                onChanged: (String email) {
                  userEmail = email;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'example@gmail.com'),
                style: TextStyle(color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 20.0),
              child: TextField(
                obscureText: true,
                textAlign: TextAlign.start,
                onChanged: (String password) {
                  userPassword = password;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'password'),
                style: TextStyle(color: Colors.black),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
              child: Hero(
                tag: 'login',
                child: LoginRegisterButton(
                  onPressed: () async {
                    try {
                      Navigator.pushNamed(context, LoadingScreen.id);
                      await _auth.signInWithEmailAndPassword(
                          email: userEmail, password: userPassword);
                      if (!context.mounted) return;
                      Navigator.pop(context);
                      Navigator.pushNamed(context, ChatScreen.id);
                    } catch (e) {
                      print(e);
                    }
                  },
                  buttonColor: Colors.deepPurple,
                  text: 'Login',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
