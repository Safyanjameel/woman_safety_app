import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validate;
  final  Function(String?)? onSave;
  final int? maxlines;
  final bool isPasword;
  final bool enable;
  final bool? check;

  final TextInputType? keyboardtype;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final Widget? prefix;
  final Widget? suffix;

  const CustomTextfield(
      {this.hintText,
      this.controller,
      this.validate,
      this.check,
      this.onSave,
      this.maxlines,
      this.isPasword = false,
      this.enable = true,
      this.keyboardtype,
      this.textInputAction,
      this.focusNode,
      this.prefix,
      this.suffix});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      cursorHeight: 30,
      enabled: enable == true ? true : enable,
      maxLines: maxlines == null ? 1 : maxlines,
      onSaved: onSave,
      focusNode: focusNode,
      textInputAction: textInputAction,
      keyboardType: keyboardtype == null ? TextInputType.name : keyboardtype,
      controller: controller,
      validator: validate,
      obscureText: isPasword == false ? false : isPasword,
      decoration: InputDecoration(
          prefix: prefix,
          suffix: suffix,
          labelText: hintText ?? "hint text....",
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              style: BorderStyle.solid,
              color: Theme.of(context).primaryColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              style: BorderStyle.solid,
              color: Color.fromARGB(255, 172, 161, 161),
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              style: BorderStyle.solid,
              color: Theme.of(context).primaryColor,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              style: BorderStyle.solid,
              color: Colors.red,
            ),
          )),
    );
  }
}
