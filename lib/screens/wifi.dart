import 'package:edp/constant.dart';
import 'package:edp/drawer.dart';
import 'package:edp/screens/password.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../processing/models.dart';
import '../processing/providers.dart';

class WifiNetworks extends StatefulWidget {
  const WifiNetworks({Key? key, required this.wifis}) : super(key: key);
  final List<wifiModel> wifis;
  @override
  State<WifiNetworks> createState() => _WifiNetworksState();
}

class _WifiNetworksState extends State<WifiNetworks> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kPrimary,
      drawer: SideDrawer(),
      appBar: AppBar(
        backgroundColor: kPrimary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Current default',
                style: GoogleFonts.lato(fontSize: 22, color: Colors.white),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding:EdgeInsets.all(8),
                child: Row(
                  children: [
                    Icon(
                      Icons.wifi,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      Provider.of<mainProv>(context, listen: false).ssid,
                      style: GoogleFonts.lato(fontSize: 18, color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Available Networks',
                style: GoogleFonts.lato(fontSize: 22, color: Colors.white),
              ),
              const SizedBox(
                height: 15,
              ),
              for (int i = 0; i < widget.wifis.length; i++)
                kRow(val: widget.wifis[i])
            ],
          ),
        ),
      ),
    ));
  }
}

class kRow extends StatelessWidget {
  const kRow({Key? key, required this.val}) : super(key: key);
  final wifiModel val;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Password(
                        currwifi: val,
                      )));
        },
        child: Row(
          children: [
            Icon(
              Icons.wifi,
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              val.name,
              style: GoogleFonts.lato(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
