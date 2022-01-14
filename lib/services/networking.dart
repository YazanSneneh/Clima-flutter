import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class NetworkHelper {

  String url;

  NetworkHelper(@required this.url);

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String result = response.body;
      return jsonDecode(result);

    } else {
      print(response.statusCode);
    }
  }

}