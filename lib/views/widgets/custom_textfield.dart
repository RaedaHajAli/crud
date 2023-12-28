import 'package:flutter/material.dart';


import '../../constants.dart';


class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,   this.maxLines = 1, this.onSaved,this.hint,this.onChanged,required this.controller});
  
 final int maxLines;
  final String? hint;
 final  void Function(String?)? onSaved;
 final  void Function(String)? onChanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        cursorColor: kPrimaryColor,
        maxLines: maxLines,
        onSaved: onSaved,
        onChanged: onChanged,
        textInputAction: TextInputAction.done,
        controller:controller ,
        
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'Field is required';
          } else {
            return null;
          }
        },
        
        decoration: InputDecoration(
          
          hintText:hint ,
          hintStyle: const TextStyle(color:kPrimaryColor, fontSize: 20),
          border: buildBorder(),
          enabledBorder: buildBorder(kPrimaryColor),
          focusedBorder: buildBorder(kPrimaryColor),
        ));
  }

  OutlineInputBorder buildBorder([color]) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color ?? Colors.white));
}
