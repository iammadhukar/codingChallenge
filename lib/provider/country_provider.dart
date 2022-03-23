import 'dart:io';

import 'package:flutter/cupertino.dart';
import "package:http/http.dart" as http;

class CountryProvider extends ChangeNotifier {
  CountryProvider();
  String baseUrl = "nationalize.io";

  ///FEtching country name for the [userName] passed
  getCountry(String userName) async {
    Map<String, dynamic> queryParameters = {
      'name': userName,
    };
    var uri = Uri.https(baseUrl, '', queryParameters);
    Map<String, String> header = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    var response = await http.get(uri, headers: header);
    if (response.statusCode == 200) {
      print("Success----");
    }
  }
}
