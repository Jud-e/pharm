import 'package:flutter/material.dart';

// import 'package:stacked/stacked_annotations.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  String? errorText;
  final TextEditingController controller;
  CustomTextField(
      {super.key,
      required this.controller,
      required this.label,
      this.errorText});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: widget.label,
          filled: true,
          fillColor: Colors.white,
          errorText: widget.errorText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.black87, width: 1)),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black87, width: 1.5))),
    );
  }
}
