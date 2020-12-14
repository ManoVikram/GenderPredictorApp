import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Gender Predictor",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: GenderPredictor(),
    );
  }
}

class GenderPredictor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gender Predictor"),
      ),
    );
  }
}

void main() => runApp(MyApp());
