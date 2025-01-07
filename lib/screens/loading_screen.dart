import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  static String id = 'loading_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'logo',
              child: Image(
                image: AssetImage('images/logo.png'),
                height: 200.0,
              ),
            ),
            SizedBox(height: 48.0),
            CircularProgressIndicator(
              value: null,
              color: Colors.orangeAccent,
              backgroundColor: Colors.black54,
              strokeWidth: 6.0,
            ),
          ],
        ),
      ),
    );
  }
}
