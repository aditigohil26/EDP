import 'package:edp/constant.dart';
import 'package:edp/screens/wifi.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConnectMCU extends StatefulWidget {
  const ConnectMCU({Key? key}) : super(key: key);

  @override
  State<ConnectMCU> createState() => _ConnectMCUState();
}

class _ConnectMCUState extends State<ConnectMCU> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: kPrimary,
      body: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const WifiNetworks()));
        },
        child: Center(
          child: Card(
            color: Colors.teal[300],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Pair with Intelligent Walker',
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 20,
              ),),
            ),
          ),
        ),
      ),
    ));
  }
}
