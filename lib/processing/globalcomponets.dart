import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Future<String?> successPopup(BuildContext context, String message) {
  return showDialog<String>(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) => AlertDialog(
            elevation: 2,
            title: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'SUCCESS!',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Lottie.asset('assets/anims/success.json',
                    height: 150, width: 150),
              ],
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
            content: Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                letterSpacing: 0.8,
              ),
            ),
          ));
}

Future<String?> errorPopup(BuildContext context, String message) {
  return showDialog<String>(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) => AlertDialog(
            elevation: 2,
            title: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'ERROR!',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Lottie.asset('assets/anims/error.json',
                    height: 150, width: 150),
              ],
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
            content: Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                letterSpacing: 0.8,
              ),
            ),
          ));
}
