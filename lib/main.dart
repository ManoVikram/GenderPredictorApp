import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/homeScreen.dart';
import './models/gender.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (contxt) => GenderPrediction(),
      child: MaterialApp(
        title: "Gender Predictor",
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: GenderPredictor(),
      ),
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
      body: HomeScreen(),
    );
  }
}

void main() => runApp(MyApp());
