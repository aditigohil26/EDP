import 'package:edp/constant.dart';
import 'package:edp/drawer.dart';
import 'package:edp/processing/apis.dart';
import 'package:edp/screens/password.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../processing/globalcomponets.dart';
import '../processing/models.dart';
import '../processing/providers.dart';

class WifiNetworks extends StatefulWidget {
  const WifiNetworks({Key? key, required this.wifis}) : super(key: key);
  final List<WifiModel> wifis;
  @override
  State<WifiNetworks> createState() => _WifiNetworksState();
}

class _WifiNetworksState extends State<WifiNetworks> {
  List<WifiModel> wifis = [];
  bool _loading = false;
  @override
  void initState() {
    wifis = widget.wifis;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kPrimary,
      drawer: const SideDrawer(),
      appBar: AppBar(
        backgroundColor: kPrimary,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            onPressed: () async {
              setState(() {
                _loading = true;
              });
              HttpRes res = await getWifi();
              setState(() {
                _loading = false;
              });
              if (res.status && context.mounted) {
                Provider.of<MainProv>(context, listen: false).wifis =
                    res.data[0];
                Provider.of<MainProv>(context, listen: false).ssid =
                    res.data[1];
                Provider.of<MainProv>(context, listen: false).email =
                    res.data[2];
                Provider.of<MainProv>(context, listen: false).phone =
                    res.data[3];
                setState(() {
                  wifis = res.data[0];
                });
              } else {
                await errorPopup(context, res.message);
                if (context.mounted) {
                  Navigator.pop(context);
                }
              }
            },
          )
        ],
      ),
      body: ModalProgressHUD(
        progressIndicator: const CircularProgressIndicator(color: Colors.white),
        inAsyncCall: _loading,
        child: SingleChildScrollView(
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
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.wifi,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        Provider.of<MainProv>(context, listen: false).ssid,
                        style:
                            GoogleFonts.lato(fontSize: 18, color: Colors.white),
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
                  WifiRow(val: widget.wifis[i])
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

class WifiRow extends StatelessWidget {
  const WifiRow({Key? key, required this.val}) : super(key: key);
  final WifiModel val;

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
            const Icon(
              Icons.wifi,
              color: Colors.white,
            ),
            const SizedBox(
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
