import 'package:flutter/material.dart';
import 'package:gullak/HomePage.dart';
import 'package:gullak/LoginPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gullak/RegistrationPage.dart';
import 'package:gullak/auth.dart';
import 'package:gullak/myUser.dart';
import 'package:provider/provider.dart';
import 'package:gullak/Wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(StreamProvider<myUser>.value(
    value: AuthService().user,
    child: MaterialApp(
      routes: {
        'Home' : (context) => HomePage(),
        'Login' : (context) => LoginPage(),
        'Register' : (context) => RegisterationPage()
      },
      home: Wrapper(),
    )
  ));
}
