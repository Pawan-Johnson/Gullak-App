import 'package:flutter/material.dart';
import 'package:gullak/auth.dart';


class RegisterationPage extends StatefulWidget {
  final Function toggleview;
  RegisterationPage({this.toggleview});
  @override
  _RegisterationPageState createState() => _RegisterationPageState();
}

class _RegisterationPageState extends State<RegisterationPage> {
  final _auth = AuthService();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  String email, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Registration Page'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
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
                'Register',
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
                          hintText: "Email Address ",
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
                    'Register',
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
                _auth.signUpEmail(email, password);
              },
            ),
            SizedBox(
              height: 30,
            ),
            RaisedButton(
              child: Text("Sign In Anon"),
              onPressed: () {
                _auth.signInAnon();
              },
            ),
            RaisedButton(
              child: Text("Sign In"),
              onPressed: () {
                widget.toggleview();
                print('View toggled');
              },
            ),
          ],
        ),
      ),
    );
  }
}
