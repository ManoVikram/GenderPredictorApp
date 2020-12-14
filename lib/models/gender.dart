import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Gender {
  final String name;
  final String gender;
  final num probability;

  Gender({
    this.name,
    this.gender,
    this.probability,
  });
}

class GenderPrediction with ChangeNotifier {
  Gender gender;

  Future<Gender> predictGender(String name) async {
    final String url = "https://api.genderize.io/?name=$name";

    final response = await http.get(url);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;

    gender = Gender(
      name: extractedData["name"],
      gender: extractedData["gender"],
      probability: extractedData["probability"],
    );
  }
}
