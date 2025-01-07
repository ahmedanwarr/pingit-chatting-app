import 'package:flutter/material.dart';
import 'package:pingit/screens/login_screen.dart';
import 'package:pingit/screens/register_screen.dart';
import 'package:pingit/utilities/loginregister_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    animation = ColorTween(begin: Colors.deepPurple, end: Colors.purpleAccent)
        .animate(controller);

    controller.forward();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Hero(
                  tag: 'logo',
                  child: Image(
                    image: AssetImage('images/logo.png'),
                    height: 60,
                  ),
                ),
              ),
              AnimatedTextKit(
                pause: Duration(milliseconds: 4000),
                animatedTexts: [
                  TypewriterAnimatedText(
                    'PING IT',
                    textStyle:
                        TextStyle(fontSize: 48.0, fontWeight: FontWeight.w700),
                    speed: Duration(milliseconds: 100),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
            child: Hero(
              tag: 'login',
              child: LoginRegisterButton(
                text: 'Login',
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                },
                buttonColor: Colors.deepPurple,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 0, 30.0, 20.0),
            child: Hero(
              tag: 'register',
              child: LoginRegisterButton(
                text: 'Register',
                onPressed: () {
                  Navigator.pushNamed(context, RegisterScreen.id);
                },
                buttonColor: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
