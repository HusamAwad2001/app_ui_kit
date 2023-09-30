import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {super.key,
      required this.label,
      this.backgroundColor,
      this.borderRadius = 10,
      this.borderColor,
      this.focusedBorderColor,
      this.isPassword = false,
      this.textEditingController,
      this.textInputAction = TextInputAction.done,
      this.textInputType = TextInputType.text,
      this.vPadding = 15,
      this.hPadding = 15,
      this.prefix,
      this.hintColor,
      this.cursorColor,
      this.textColor,
      this.suffix,
      this.maxLines = 1,
      this.minLines = 1,
      this.maxLength = 255});

  final String label;
  final Color? backgroundColor;
  final double borderRadius;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? hintColor;
  final Color? cursorColor;
  final Color? textColor;
  final bool isPassword;
  final TextEditingController? textEditingController;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final double vPadding;
  final double hPadding;
  final Widget? prefix;
  final Widget? suffix;
  final int maxLines;
  final int minLines;
  final int maxLength;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      maxLines: isPassword ? 1 : maxLines,
      minLines: isPassword ? 1 : minLines,
      maxLength: maxLength,
      controller: textEditingController ?? TextEditingController(),
      textInputAction: textInputAction,
      keyboardType: textInputType,
      onTapOutside: (_) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      style: TextStyle(color: textColor ?? Colors.black),
      cursorColor: hintColor ?? Theme.of(context).primaryColor,
      decoration: InputDecoration(
          hintStyle: TextStyle(color: hintColor ?? Colors.grey),
          hintText: label,
          counter: const SizedBox.shrink(),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              borderSide: BorderSide(color: borderColor ?? Colors.transparent)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              borderSide: BorderSide(color: Theme.of(context).primaryColor)),
          filled: true,
          prefixIcon: prefix == null
              ? const SizedBox()
              : Container(
                  width: kMinInteractiveDimension,
                  height: kMinInteractiveDimension,
                  alignment: Alignment.center,
                  child: prefix,
                ),
          prefixIconConstraints: prefix == null
              ? BoxConstraints(minWidth: vPadding)
              : Theme.of(context).visualDensity.effectiveConstraints(
                    const BoxConstraints(
                      minWidth: kMinInteractiveDimension,
                      minHeight: kMinInteractiveDimension,
                    ),
                  ),
          suffixIcon: suffix == null
              ? const SizedBox()
              : Container(
                  width: kMinInteractiveDimension,
                  height: kMinInteractiveDimension,
                  alignment: Alignment.center,
                  child: suffix,
                ),
          suffixIconConstraints: suffix == null
              ? BoxConstraints(minWidth: vPadding)
              : Theme.of(context).visualDensity.effectiveConstraints(
                    const BoxConstraints(
                      minWidth: kMinInteractiveDimension,
                      minHeight: kMinInteractiveDimension,
                    ),
                  ),
          contentPadding:
              EdgeInsets.symmetric(vertical: vPadding, horizontal: hPadding),
          fillColor: backgroundColor ?? Colors.white,
          isDense: true),
    );
  }
}
