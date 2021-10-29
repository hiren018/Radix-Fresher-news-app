import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:radix_freshers/detail.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radix Freshers'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.red[400],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome To Radix Freshers !!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.grey[300]),
                child: TextButton(
                  onPressed: () {
                    signin(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('images/google-logo.png',
                          height: 30, width: 30),
                      Text(
                        '   Signin with Google',
                        style: TextStyle(fontSize: 17),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Function to implement google signin

final auth = FirebaseAuth.instance;

Future<void> signin(BuildContext context) async {
  final signin = GoogleSignIn();
  final googleaccount = await signin.signIn();

  if (GoogleSignInAccount != null) {
    final googlauth = await googleaccount!.authentication;

    final AuthCredential authCredential = GoogleAuthProvider.credential(
      idToken: googlauth.idToken,
      accessToken: googlauth.accessToken,
    );

    UserCredential result = await auth.signInWithCredential(authCredential);
    User? user = result.user;

    if (result != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Detail(),
        ),
      );
    }
  }
}
