import 'package:flutter/material.dart';

buildSnackBar(BuildContext context ,{required String msg, required Color color}){
  ScaffoldMessenger.of(context).showSnackBar( SnackBar(
            duration: const Duration(seconds: 2),
            backgroundColor: color,
            content: Text(
              msg,
              style: const TextStyle(color: Colors.white),
            ),
          ));
}

Future<dynamic> buildShowModalSheet(BuildContext context,
      {required Widget bottomSheet}) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        builder: (context) {
          return bottomSheet;
        });
  }