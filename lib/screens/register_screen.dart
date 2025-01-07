import 'package:flutter/material.dart';
import 'package:pingit/constants.dart';
import 'package:pingit/screens/chat_screen.dart';
import 'package:pingit/screens/loading_screen.dart';
import 'package:pingit/screens/login_screen.dart';
import 'package:pingit/utilities/loginregister_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  static String id = 'register_screen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with SingleTickerProviderStateMixin {
  final _auth = FirebaseAuth.instance;
  late AnimationController _controller;
  late bool loading = false;
  late String email;
  late String password;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void startloading() {
    setState(() {
      loading = true;
      _controller.repeat();
    });
  }

  void stoploading() {
    setState(() {
      loading = false;
      _controller.reset();
    });
  }

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
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.start,
                onChanged: (String emailUser) {
                  email = emailUser;
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
                onChanged: (String passwordUser) {
                  password = passwordUser;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'password'),
                style: TextStyle(color: Colors.black),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
              child: Hero(
                tag: 'register',
                child: LoginRegisterButton(
                  buttonColor: Colors.black,
                  text: 'Register',
                  onPressed: () async {
                    Navigator.pushNamed(context, LoadingScreen.id);
                    await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if (!context.mounted) return;
                    Navigator.pop(context);
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
