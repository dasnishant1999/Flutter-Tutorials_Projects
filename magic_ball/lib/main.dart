import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.purple.shade100,
        appBar: AppBar(
          elevation: 10,
          backgroundColor: Colors.purple,
          title: Text(
            'Ask Me Anything',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: MagicPage(),
      ),
    );
  }
}

class MagicPage extends StatefulWidget {
  @override
  _MagicPageState createState() => _MagicPageState();
}

class _MagicPageState extends State<MagicPage> {
  var random = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlatButton(
        splashColor: Colors.purple.shade100,
        onPressed: () {
          setState(() {
            random=Random().nextInt(5)+1;
          });
        },
        child: Image.asset('images/ball$random.png'),
      ),
    );
  }
}
