import 'dart:io';
import 'dart:convert' as convert;
import 'package:flutter/cupertino.dart';
import "package:http/http.dart" as http;

import '../model/country.dart';

class CountryProvider extends ChangeNotifier {
  CountryProvider();
  String baseUrl = "api.nationalize.io";

  List<Country>? _countries;
  List<Country>? get countries => _countries;

  bool fetchingCountry = false;

  ///Fetching country name for the [userName] passed
  getCountry(String userName) async {
    _countries = null;
    fetchingCountry = true;
    notifyListeners();
    Map<String, dynamic> queryParameters = {
      'name': userName,
    };
    var uri = Uri.https(baseUrl, '', queryParameters);
    // var uri = Uri.parse('$baseUrl?name=$userName');
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Charset': 'utf-8',
      "Accept": "application/json",
    };
    var response = await http.get(uri, headers: header);
    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body) as Map<String, dynamic>;
      if (json['country'] != null) {
        _countries = [];
        json['country'].forEach((element) {
          _countries!.add(Country.fromJson(element));
        });
      }
    }
    fetchingCountry = false;
    notifyListeners();
  }
}
