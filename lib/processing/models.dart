class HttpRes {
  bool status;
  String message;
  var data;
  HttpRes({required this.message, required this.status, required this.data});
}

class WifiModel {
  String name;
  int strength;
  WifiModel({required this.name, required this.strength});

  factory WifiModel.fromJSON(Map<String, dynamic> x) {
    return WifiModel(name: x['name'], strength: x['strength']);
  }
}
