import 'package:edp/processing/models.dart';
import 'package:flutter/material.dart';

class mainProv with ChangeNotifier {
  List<wifiModel> wifis = [];
  String ssid = "";
  String pass = "";
  String email = "";
  String phone = "";
}
