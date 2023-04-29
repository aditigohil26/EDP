import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant.dart';

class UpdatePhone extends StatefulWidget {
  const UpdatePhone({Key? key}) : super(key: key);

  @override
  State<UpdatePhone> createState() => _UpdatePhoneState();
}

class _UpdatePhoneState extends State<UpdatePhone> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        backgroundColor: kPrimary,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter Phone Number :',
              style: GoogleFonts.lato(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              style: GoogleFonts.lato(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.teal[300],
              ),
              cursorColor: Colors.white,
              autofocus: true,
            ),
            SizedBox(height: 10,),
            Center(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Update',
                      style: GoogleFonts.lato(
                          color: kPrimary,
                          fontSize: 17
                      ),),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
