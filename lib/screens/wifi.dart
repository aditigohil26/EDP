import 'package:edp/constant.dart';
import 'package:edp/drawer.dart';
import 'package:edp/screens/password.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class WifiNetworks extends StatefulWidget {
  const WifiNetworks({Key? key}) : super(key: key);

  @override
  State<WifiNetworks> createState() => _WifiNetworksState();
}

class _WifiNetworksState extends State<WifiNetworks> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
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
              Text('Available Networks',
                style: GoogleFonts.lato(
                  fontSize: 22,
                  color: Colors.white
                ),
              ),
              SizedBox(
                height: 15,
              ),
              kRow(val: 'Wifi 1'),
              kRow(val: 'Wifi 2'),
              kRow(val: 'Wifi 3'),
              kRow(val: 'Wifi 4')
            ],
          ),
        ),
      ),
    ));
  }
}

class kRow extends StatelessWidget {
  const kRow({Key? key, required this.val}) : super(key: key);
  final String val;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Password()));
        },
        child: Row(
          children: [
            Icon(Icons.wifi,
            color: Colors.white,),
            SizedBox(width: 10,),
            Text(val,
            style: GoogleFonts.lato(
              fontSize: 18,
              color: Colors.white
            ),),
          ],
        ),
      ),
    );
  }
}

