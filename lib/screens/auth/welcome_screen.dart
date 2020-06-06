import 'package:crowdlytics/screens/app/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:crowdlytics/components/rounded_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email'
  ],
);


class WelcomeScreen extends StatefulWidget {

  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {


  GoogleSignInAccount _currentUser;

  String _contactText;
  String data;


  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) async {
      setState(() {
        _currentUser = account;
      });
      if (_currentUser != null) {

      }
    });
    //_googleSignIn.signInSilently();
  }


  Future<void> _handleSignIn() async {
    try {
      _currentUser = await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(data == null ? "loading" : data),
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: [' Crowdlytics'],
                  textStyle: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.white
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              title: "Sign In With Google",
              colour: Colors.red,
              onPressed: () async {
                await _handleSignIn();
                var url = 'http://localhost:4567/login';

                var response = await http.post(url, body: json.encode(
                    {
                      "display_name": _currentUser.displayName,
                      "photo_url": _currentUser.photoUrl,
                      "id" : _currentUser.id
                    }),
                    headers: {"Content-Type": "application/json"});
                setState(() {
                  data = response.body;
                });
                //Navigator.pushNamed(context, HomeScreen.id);

              },
            ),
          ],
        ),
      ),
    );
  }
}


