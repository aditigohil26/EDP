import 'package:edp/processing/models.dart';
import 'package:edp/processing/providers.dart';
import 'package:edp/screens/contactupdate.dart';
import 'package:edp/screens/wifi.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      color: Colors.teal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 30,
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: GestureDetector(
              onTap: () {
                List<WifiModel> currwifis =
                    Provider.of<MainProv>(context, listen: false).wifis;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WifiNetworks(
                              wifis: currwifis,
                            )));
              },
              child: Text(
                'Wi-Fi',
                style: GoogleFonts.lato(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ContactUpdate()));
              },
              child: Text(
                'Contact Update',
                style: GoogleFonts.lato(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
