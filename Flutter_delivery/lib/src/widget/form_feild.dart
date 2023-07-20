import 'package:flutter/material.dart';

class FormFieldFrave extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool isPassword;
  final TextInputType keyboardType;
  final int maxLine;
  final bool readOnly;
  final FormFieldValidator<String>? validator;

  const FormFieldFrave(
      {this.controller,
      this.hintText,
      this.isPassword = false,
      this.keyboardType = TextInputType.text,
      this.maxLine = 1,
      this.readOnly = false,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      maxLines: maxLine,
      readOnly: readOnly,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.orange)),
        contentPadding: const EdgeInsets.only(left: 15.0),
        hintText: hintText,
      ),
      validator: validator,
    );
  }
}
