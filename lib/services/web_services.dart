import 'dart:convert';

import '../models/countries_model.dart';
import 'package:http/http.dart' as http;

class Webservice {
  Future<List<Country>> fetchCountries(int limit, int offset) async {
    final url =
        "https://api.first.org/data/v1/countries?scope=iso&limit=$limit&offset=$offset";
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final json = body["data"];
      final list = [];
      json.forEach((key, value) => list.add(value));
      // return list;
      // print(json.map((movie) => Country.fromJson(movie)).toList());
      return list.map((country) => Country.fromJson(country)).toList();
    } else {
      throw Exception("Unable to perform request!");
    }
  }
}
