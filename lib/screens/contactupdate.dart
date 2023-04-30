import 'package:edp/drawer.dart';
import 'package:edp/processing/globalcomponets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../constant.dart';
import '../processing/apis.dart';
import '../processing/models.dart';
import '../processing/providers.dart';

class ContactUpdate extends StatefulWidget {
  const ContactUpdate({Key? key}) : super(key: key);

  @override
  State<ContactUpdate> createState() => _ContactUpdateState();
}

class _ContactUpdateState extends State<ContactUpdate> {
  String email = "";
  String phone = "";
  final formkey = GlobalKey<FormState>();
  bool _loading = false;
  @override
  void initState() {
    email = Provider.of<MainProv>(context, listen: false).email;
    phone = Provider.of<MainProv>(context, listen: false).phone;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const SideDrawer(),
        appBar: AppBar(
          backgroundColor: kPrimary,
        ),
        backgroundColor: kPrimary,
        body: Form(
          key: formkey,
          child: ModalProgressHUD(
            inAsyncCall: _loading,
            progressIndicator: const CircularProgressIndicator(
              color: Colors.white,
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Enter Email ID :',
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
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
                    initialValue: email,
                    validator: (value) {
                      const pattern =
                          r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
                      final regExp = RegExp(pattern);

                      if (value != null && value.trim().isEmpty) {
                        return 'Enter an email';
                      } else if (value != null &&
                          !regExp.hasMatch(value.trim())) {
                        return 'Enter a valid email';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      email = value?.trim() ?? '';
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Enter Phone Number :',
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    style: GoogleFonts.lato(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.teal[300],
                    ),
                    cursorColor: Colors.white,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.phone,
                    initialValue: phone,
                    onSaved: (value) {
                      phone = value!;
                    },
                    validator: (value) {
                      const pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                      final exp = RegExp(pattern);
                      if (value != null && value.trim().isEmpty) {
                        return 'Phone number required';
                      } else if (!exp.hasMatch(value!)) {
                        return 'Invalid phone number';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () async {
                        if (formkey.currentState?.validate() ?? false) {
                          formkey.currentState?.save();
                          setState(() {
                            _loading = true;
                          });
                          HttpRes res = await setContact(email, phone);
                          setState(() {
                            _loading = false;
                          });
                          if (res.status && context.mounted) {
                            await successPopup(context,
                                "Saved successfully, Rebooting device");
                            if (context.mounted) {
                              Navigator.popUntil(context,
                                  (Route<dynamic> route) => route.isFirst);
                            }
                          } else {
                            errorPopup(context, res.message);
                          }
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Update',
                            style:
                                GoogleFonts.lato(color: kPrimary, fontSize: 17),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
