import 'package:flutter/material.dart';

import '../../constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({this.onTap, required this.text, this.isLoading = false});
  final String? text;
  final VoidCallback? onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        decoration: BoxDecoration(
            color: kPrimaryColor, borderRadius: BorderRadius.circular(8)),
        alignment: Alignment.center,
        child:  Text('$text',
                style: const TextStyle(
                    fontSize: 24, color: Colors.white)),
      ),
    );
  }
}
