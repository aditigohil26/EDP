import 'package:edp/constant.dart';
import 'package:edp/processing/apis.dart';
import 'package:edp/processing/globalcomponets.dart';
import 'package:edp/processing/models.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Password extends StatefulWidget {
  const Password({Key? key, required this.currwifi}) : super(key: key);
  final WifiModel currwifi;
  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  final TextEditingController _passController = TextEditingController();
  bool _loading = false;
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
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: _loading,
        progressIndicator: const CircularProgressIndicator(
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter Password -',
                style: GoogleFonts.lato(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                style: GoogleFonts.lato(
                  color: Colors.white,
                ),
                controller: _passController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.teal[300],
                ),
                obscureText: true,
                cursorColor: Colors.white,
                autofocus: true,
                onSubmitted: (val) async {
                  setState(() {
                    _loading = true;
                  });
                  HttpRes res = await setWifi(widget.currwifi.name, val);
                  setState(() {
                    _loading = false;
                  });
                  if (res.status && context.mounted) {
                    await successPopup(
                        context, '${res.message}, Rebooting device!');
                    if (context.mounted) {
                      Navigator.popUntil(
                          context, (Route<dynamic> route) => route.isFirst);
                    }
                  } else {
                    errorPopup(context, res.message);
                  }
                },
              )
            ],
          ),
        ),
      ),
    ));
  }
}
