import 'package:edp/constant.dart';
import 'package:edp/processing/apis.dart';
import 'package:edp/processing/globalcomponets.dart';
import 'package:edp/processing/models.dart';
import 'package:edp/processing/providers.dart';
import 'package:edp/screens/wifi.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class ConnectMCU extends StatefulWidget {
  const ConnectMCU({Key? key}) : super(key: key);

  @override
  State<ConnectMCU> createState() => _ConnectMCUState();
}

class _ConnectMCUState extends State<ConnectMCU> {
  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kPrimary,
      body: ModalProgressHUD(
        inAsyncCall: _loading,
        progressIndicator: const CircularProgressIndicator(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Text(
                  'Instructions',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text(
                  '\u2022 Please press the button on your device till you observe a fast blinking LED',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text(
                  '\u2022 Please connect this phone to the wifi named "Intelligent-Walker"',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text(
                  '\u2022 Please click pair!',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ]),
            GestureDetector(
              onTap: () async {
                setState(() {
                  _loading = true;
                });
                httpres res = await getWifi();
                setState(() {
                  _loading = false;
                });
                if (res.status && context.mounted) {
                  Provider.of<mainProv>(context, listen: false).wifis =
                      res.data[0];
                  Provider.of<mainProv>(context, listen: false).ssid =
                      res.data[1];
                  Provider.of<mainProv>(context, listen: false).email =
                      res.data[2];
                  Provider.of<mainProv>(context, listen: false).phone =
                      res.data[3];
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WifiNetworks(
                                wifis: res.data[0],
                              )));
                } else {
                  errorPopup(context,
                      '${res.message} You have not connected to device wifi!');
                }
              },
              child: Center(
                child: Card(
                  color: Colors.teal[300],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Pair with Intelligent Walker',
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
