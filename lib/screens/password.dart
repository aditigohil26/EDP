import 'package:edp/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Password extends StatefulWidget {
  const Password({Key? key}) : super(key: key);

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        backgroundColor: kPrimary,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back,
          color: Colors.white,),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text('Enter Password -',
              style: GoogleFonts.lato(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10,),
            TextFieldInput(textEditingController: _passController,)
          ],
        ),
      ),
    ));
  }
}

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  const TextFieldInput({
    Key? key,
    required this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return TextField(
      style: GoogleFonts.lato(
        color: Colors.white,
      ),
      controller: textEditingController,
      decoration: InputDecoration(
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.teal[300],
      ),
      obscureText: true,
      cursorColor: Colors.white,
      autofocus: true,
    );
  }
}
