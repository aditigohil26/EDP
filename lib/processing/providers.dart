import 'package:edp/processing/models.dart';
import 'package:flutter/material.dart';

class MainProv with ChangeNotifier {
  List<WifiModel> wifis = [];
  String ssid = "";
  String pass = "";
  String email = "";
  String phone = "";
}
