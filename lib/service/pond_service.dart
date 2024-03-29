import 'dart:convert';
import 'package:fish/models/pond_model.dart';
import 'package:fish/service/url_api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PondService {
  Future<List<Pond>> getPonds() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();
    var url = Uri.parse(Urls.ponds);
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<Pond> ponds = [];

      for (var item in data) {
        ponds.add(Pond.fromJson(item));
      }

      return ponds;
    } else {
      throw Exception('Gagal Get Ponds!');
    }
  }

  Future<void> getPondDetail({required String pondId}) async {
    var url = Uri.parse(Urls.pond(pondId));
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      // Pond pond = Pond.fromJson(data);
      // print(pond);

      // return pond;
    } else {
      throw Exception('Gagal Get Detial Pond!');
    }
  }

  Future<bool> pondRegister(
      {required String? alias,
      required String? location,
      required String? shape,
      required String? material,
      required String? length,
      required String? width,
      required String? diameter,
      required String? height,
      required String? status}) async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();
    final response = await http.post(
      Uri.parse(Urls.ponds),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        'Authorization': 'Bearer $token'
      },
      encoding: Encoding.getByName('utf-8'),
      body: {
        "alias": alias,
        "location": location,
        "shape": shape,
        "material": material,
        "status": status,
        "length": length,
        "width": width,
        "diameter": diameter,
        "height": height,
      },
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
