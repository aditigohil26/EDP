class httpres {
  bool status;
  String message;
  var data;
  httpres({required this.message, required this.status, required this.data});
}

class wifiModel {
  String name;
  int strength;
  wifiModel({required this.name, required this.strength});

  factory wifiModel.fromJSON(Map<String, dynamic> x) {
    return wifiModel(name: x['name'], strength: x['strength']);
  }
}
