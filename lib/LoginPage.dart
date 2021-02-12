import 'package:flutter/material.dart';

import 'package:gullak/auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
  final Function toggleview;
  LoginPage({this.toggleview});
}

class _LoginPageState extends State<LoginPage> {
  final _auth = AuthService();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  String email, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //     title: Text('Gullak'),
      // centerTitle: true,
      //   backgroundColor: Colors.blueAccent,
      // ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Center(
              child: Container(
                height: 200,
                width: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/bank.jpg'),
                      fit: BoxFit.fill),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                  child: Text(
                'Login',
                style: TextStyle(fontSize: 30),
              )),
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          hintText: "Registered Email Address ",
                          hintStyle: TextStyle(color: Colors.grey)),
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        email = emailController.text;
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.grey)),
                    controller: passwordController,
                    onChanged: (value) {
                      password = passwordController.text;
                      print(password);
                    },
                  ),
                ],
              ),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(),
              child: Container(
                padding: const EdgeInsets.all(0.0),
                child: Center(
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(colors: [
                      Colors.blue,
                      Colors.lightBlue,
                    ])),
              ),
              onPressed: () {
                _auth.signInEmail(email, password);
              },
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              buttonPadding: EdgeInsets.all(10),
              children: [
                Text(
                  'Forgot Password ?',
                  style: TextStyle(fontSize: 10),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            RaisedButton(
              child: Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(colors: [
                      Colors.blue,
                      Colors.lightBlue,
                    ])),
                child: Center(
                    child: Text(
                  'New User? Create Account ',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                )),
              ),
              onPressed: () {
                widget.toggleview();
              },
            ),
            RaisedButton(
              child: Text("Sign In Anonymously"),
              onPressed: () async {
                dynamic result = await _auth.signInAnon();
                if (result == null) {
                  print("Error Signing In");
                } else {
                  print("Signed In");
                  print(result);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
