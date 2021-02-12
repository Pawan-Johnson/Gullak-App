import 'package:flutter/material.dart';
import 'package:gullak/HomePage.dart';
import 'package:gullak/LoginPage.dart';
import 'package:gullak/RegistrationPage.dart';
import 'package:gullak/myUser.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  bool showRegPage = false;
  void toggleView() {
    setState(() {
      showRegPage = !showRegPage;
    });

  }
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<myUser>(context);
    // print(user);
    if (user == null)
      if(showRegPage)
        return RegisterationPage(toggleview: toggleView);
      else
        return LoginPage(toggleview: toggleView);
    else
      return HomePage();
  }
}



