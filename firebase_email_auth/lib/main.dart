  import 'package:flutter/material.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter with Firebase',
      home: HomePage(),
    );
  }
}
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text("Flutter with Firebase"),) ,
      body: Center(
           child: Column(children: <Widget>[
          TextField(
            decoration:
            InputDecoration(
              labelText: "Email"
             )
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Password"
              ),
            )
          
        ],)
        
       

      ),
      
    );
  }
}


