import 'package:firebase_email_auth/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var emailTC = TextEditingController();

  var passwordTC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
                controller: emailTC,
                decoration: InputDecoration(labelText: "Email")),
            TextFormField(
              controller: passwordTC,
              obscureText: true,
              decoration: InputDecoration(labelText: "Password"),
            ),
            FlatButton(
                child: Text("Register"),
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: () {
                  register(emailTC.text, passwordTC.text);
                }),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => HomePage()));
              },
              child: Text("Log in into an account",
                  style: TextStyle(color: Colors.blueAccent)),
            )
          ],
        )),
      ),
    );
  }

  register(emailAddr, pass) {
    _auth
        .createUserWithEmailAndPassword(email: emailAddr, password: pass)
        .then((FirebaseUser user) => print(user))
        .catchError((e) => print(e));
  }
}
