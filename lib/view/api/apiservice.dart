import 'dart:convert';

import 'package:demogetapi/model/cart/dummy.dart';
import 'package:http/http.dart' as http;

class Apiservice {
  fetchData() async {
    final response = await http.get(Uri.parse("https://dummyjson.com/cart"));
    var jsonn = jsonDecode(response.body);
    var respmain = RespMain.fromJson(jsonn);
    var list = respmain.carts;
    return list;
  }
}