import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      this.hintText,
      this.onChanged,
      this.validator,
      this.obsecureText = false});
  String? hintText;
  Function(String)? onChanged;
  String? Function(String?)? validator;
  bool? obsecureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecureText!,
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
