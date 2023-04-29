import 'package:edp/drawer.dart';
import 'package:edp/screens/update%20email.dart';
import 'package:edp/screens/update%20phone.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant.dart';
class ContactUpdate extends StatefulWidget {
  const ContactUpdate({Key? key}) : super(key: key);

  @override
  State<ContactUpdate> createState() => _ContactUpdateState();
}

class _ContactUpdateState extends State<ContactUpdate> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        backgroundColor: kPrimary,
      ),
      backgroundColor: kPrimary,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Update :',
            style: GoogleFonts.lato(
              fontSize: 22,
              color: Colors.white,
            ),),
            SizedBox(height: 10,),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const UpdatePhone()));
              },
              child: Card(
                color: Colors.teal[300],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Phone Number',
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      color: Colors.white,
                    ),),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const UpdateEmail()));
              },
              child: Card(
                color: Colors.teal[300],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Email ID',
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      color: Colors.white,
                    ),),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}
