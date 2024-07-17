import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hint,
    this.prefexIcon,
    this.sufxIcon,
    this.onChange,
    this.onSubmitted,
    this.controller,
    this.obSecureText = false,
    this.inputType,
    this.initialValue,
  });

  final String? hint;
  final Icon? prefexIcon;
  final Icon? sufxIcon;
  final Function(String)? onChange;
  final Function(String)? onSubmitted;
  final TextEditingController? controller;
  final bool? obSecureText;
  final TextInputType? inputType;
  final String? initialValue;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: inputType,
      obscureText: obSecureText!,
      controller: controller,
      onChanged: onChange,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.transparent,
        hintText: hint,
        prefixIcon: prefexIcon,
        suffixIcon: sufxIcon,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
          borderSide: BorderSide(),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
          borderSide: BorderSide(),
        ),
      ),
    );
  }
}
