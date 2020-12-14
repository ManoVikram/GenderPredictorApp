import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/gender.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _showButton = false;

  Gender gender;

  void _predictGender(String name, BuildContext contxt) async {
    Provider.of<GenderPrediction>(contxt, listen: false)
        .predictGender(name.trim());
    setState(() {
      gender = Provider.of<GenderPrediction>(contxt, listen: false).gender;
    });
  }

  void _activateButton(String text) {
    if (text.trim().length > 0) {
      setState(() {
        _showButton = true;
      });
    } else {
      setState(() {
        _showButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Tell me your name, I'll tell your gender...",
            textScaleFactor: 2,
          ),
          TextField(
            controller: _controller,
            autocorrect: true,
            cursorColor: Colors.indigo,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Name",
            ),
            onChanged: (value) => _activateButton(_controller.text),
          ),
          RaisedButton(
            onPressed: _showButton
                ? () => _predictGender(_controller.text, context)
                : null,
            color: Colors.indigoAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text("Generate"),
          ),
          if (gender != null)
            Text(
              gender.gender == null
                  ? "Couldn't predict gender."
                  : "GENDER: ${gender.gender.toUpperCase()} | PROBABILITY: ${gender.probability}",
            ),
        ],
      ),
    );
  }
}
