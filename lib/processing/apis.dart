import 'dart:convert';

import 'package:edp/constant.dart';
import 'package:edp/processing/models.dart';
import 'package:http/http.dart' as http;

Future<httpres> getWifi() async {
  try {
    http.Response res = await http.get(Uri.parse("$serverURL/"));
    print(res.statusCode);
    if (res.statusCode == 200) {
      String responseBody = res.body;
      print(jsonDecode(responseBody));
      var data = jsonDecode(responseBody)['st'];
      String ssid = jsonDecode(responseBody)['wifi'];
      String email = jsonDecode(responseBody)['email'];
      String phone = jsonDecode(responseBody)['phone'];
      List<wifiModel> wifis = [];
      for (var x in data) {
        wifis.add(wifiModel.fromJSON(x));
      }
      return httpres(
          message: "Paired successfully",
          status: true,
          data: [wifis, ssid, email, phone]);
    } else {
      return httpres(
          message: responseMeaning(res.statusCode), status: false, data: []);
    }
  } catch (e) {
    print(e);
    return httpres(message: "", status: false, data: []);
  }
}

Future<httpres> setContact(String email, String phone) async {
  try {
    http.Response res = await http.post(
      Uri.parse("$serverURL/contactsetting"),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      encoding: Encoding.getByName('utf-8'),
      body: {"email": email, "phone": phone},
    );
    if (res.statusCode == 200) {
      return httpres(message: "Saved!", status: true, data: []);
    } else {
      return httpres(
          message: responseMeaning(res.statusCode), status: false, data: []);
    }
  } catch (e) {
    return httpres(
        message: "Error communicating, please retry", status: false, data: []);
  }
}

Future<httpres> setWifi(String ssid, String pass) async {
  try {
    http.Response res = await http.post(
      Uri.parse("$serverURL/wifisetting"),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      encoding: Encoding.getByName('utf-8'),
      body: {"ssid": ssid, "pass": pass},
    );
    if (res.statusCode == 200) {
      return httpres(message: "Saved!", status: true, data: []);
    } else {
      return httpres(
          message: responseMeaning(res.statusCode), status: false, data: []);
    }
  } catch (e) {
    return httpres(
        message: "Error communicating, please retry", status: false, data: []);
  }
}

String responseMeaning(int status) {
  if (status == 100) {
    return 'Continue';
  } else if (status == 101) {
    return 'Switching Protocols';
  } else if (status == 102) {
    return 'Processing';
  } else if (status == 200) {
    return 'OK';
  } else if (status == 201) {
    return 'Created';
  } else if (status == 202) {
    return 'Accepted';
  } else if (status == 203) {
    return 'Non Authoritative Information';
  } else if (status == 204) {
    return 'No Content';
  } else if (status == 205) {
    return 'Reset Content';
  } else if (status == 206) {
    return 'Partial Content';
  } else if (status == 207) {
    return 'Multi-Status';
  } else if (status == 300) {
    return 'Multiple Choices';
  } else if (status == 301) {
    return 'Moved Permanently';
  } else if (status == 302) {
    return 'Moved Temporarily';
  } else if (status == 303) {
    return 'See Other';
  } else if (status == 304) {
    return 'Not Modified';
  } else if (status == 305) {
    return 'Use Proxy';
  } else if (status == 307) {
    return 'Temporary Redirect';
  } else if (status == 308) {
    return 'Permanent Redirect';
  } else if (status == 400) {
    return 'Bad Request';
  } else if (status == 401) {
    return 'Unauthorized';
  } else if (status == 402) {
    return 'Payment Required';
  } else if (status == 403) {
    return 'Forbidden';
  } else if (status == 404) {
    return 'Not Found';
  } else if (status == 405) {
    return 'Method Not Allowed';
  } else if (status == 406) {
    return 'Not Acceptable';
  } else if (status == 407) {
    return 'Proxy Authentication Required';
  } else if (status == 408) {
    return 'Request Timeout';
  } else if (status == 409) {
    return 'Conflict';
  } else if (status == 410) {
    return 'Gone';
  } else if (status == 411) {
    return 'Length Required';
  } else if (status == 412) {
    return 'Precondition Failed';
  } else if (status == 413) {
    return 'Request Entity Too Large';
  } else if (status == 414) {
    return 'Request-URI Too Long';
  } else if (status == 415) {
    return 'Unsupported Media Type';
  } else if (status == 416) {
    return 'Requested Range Not Satisfiable';
  } else if (status == 417) {
    return 'Expectation Failed';
  } else if (status == 418) {
    return 'I\'m a teapot';
  } else if (status == 419) {
    return 'Insufficient Space on Resource';
  } else if (status == 420) {
    return 'Method Failure';
  } else if (status == 422) {
    return 'Unprocessable Entity';
  } else if (status == 423) {
    return 'Locked';
  } else if (status == 424) {
    return 'Failed Dependency';
  } else if (status == 428) {
    return 'Precondition Required';
  } else if (status == 429) {
    return 'Too Many Requests';
  } else if (status == 431) {
    return 'Request Header Fields Too Large';
  } else if (status == 451) {
    return 'Unavailable For Legal Reasons';
  } else if (status == 500) {
    return 'Internal Server Error';
  } else if (status == 501) {
    return 'Not Implemented';
  } else if (status == 502) {
    return 'Bad Gateway';
  } else if (status == 503) {
    return 'Service Unavailable';
  } else if (status == 504) {
    return 'Gateway Timeout';
  } else if (status == 505) {
    return 'HTTP Version Not Supported';
  } else if (status == 507) {
    return 'Insufficient Storage';
  } else if (status == 511) {
    return 'Network Authentication Required';
  } else {
    return 'Fail';
  }
}
