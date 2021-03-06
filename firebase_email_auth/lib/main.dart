import 'package:firebase_email_auth/register.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() => runApp(Home());
var emailTC = TextEditingController();
var passwordTC = TextEditingController();

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter with Firebase',
      theme: ThemeData.light(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
                child: Text("Login"),
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: () {
                  login(emailTC.text, passwordTC.text);
                }),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Register()));
              },
              child: Text("Create an account",
                  style: TextStyle(color: Colors.blueAccent)),
            )
          ],
        )),
      ),
    );
  }

  login(emailAddr, pass) {
    _auth
        .signInWithEmailAndPassword(email: emailAddr, password: pass)
        .then((FirebaseUser user) => print(user))
        .catchError((e) => print(e));
  }
}
