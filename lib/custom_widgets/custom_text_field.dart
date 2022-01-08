import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hint;
  final bool? isSecure;
  final bool? isFocused;
  final TextInputType? textInputType;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    Key? key,
    required this.hint,
    this.isSecure = false,
    this.isFocused = false,
    this.textInputType,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  //static TextStyle labelTextStyle = const TextStyle();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 20,
      ),
      child: TextFormField(
        autofocus: isFocused!,
        showCursor: true,
        cursorColor: Colors.white,
        keyboardType: TextInputType.emailAddress,
        obscureText: isSecure!,
        onChanged: onChanged,
        validator: validator,
        decoration: InputDecoration(
          fillColor: Colors.blue,
          filled: true,
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white, fontSize: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}
