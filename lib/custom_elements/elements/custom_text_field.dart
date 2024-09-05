import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:demo_template/custom_elements/custom_elements.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    required this.controller,
    this.radius = 10,
    this.keyboardType,
    this.borderColor = CustomColors.checkBoxColor,
    this.fillColor = CustomColors.textFieldColor,
    this.boderWidth = 1,
    this.outPadding = 0,
    this.fontSize,
    this.contentPadding = const EdgeInsets.all(12),
    this.maxLength,
    this.counter = false,
    this.hint = '',
    this.hintStyle,
    this.obscureText = false,
    this.textAlign,
    this.enabled,
    this.onChange,
    this.onFieldSubmitted,
    this.validator,
    this.displayError = true,
    this.height,
    this.width,
    this.errorTextStyle,
    this.border,
    this.filled = true,
    this.prefixIcon,
    this.suffixIcon,
    this.style,
    this.textInputAction,
    this.onTap,
    this.maxLines,
    this.isDense = true,
    this.readOnly = false,
    this.autofocus = false,
    this.obscuringCharacter = "*",
    this.decoration,
  });

  final TextEditingController controller;
  double radius;
  Color borderColor;
  bool displayError;
  Color fillColor;
  double boderWidth;
  bool? enabled;
  double? height;
  double? width;
  double? fontSize;
  double outPadding;
  EdgeInsets? contentPadding;
  int? maxLength;
  bool counter;
  bool obscureText;
  bool autofocus;
  String hint;
  TextStyle? hintStyle;
  TextInputType? keyboardType;
  TextAlign? textAlign;
  TextStyle? errorTextStyle;
  List<TextInputFormatter>? inputFormatter;
  int? maxLines;
  Function(String)? onChange;
  Function(String)? onFieldSubmitted;
  String? Function(String?)? validator;
  InputBorder? border;
  bool filled;
  Widget? prefixIcon;
  Widget? suffixIcon;
  TextStyle? style;
  bool isDense;
  bool readOnly;
  TextInputAction? textInputAction;
  String obscuringCharacter;
  VoidCallback? onTap;
  InputDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(outPadding),
      child: SizedBox(
        height: height,
        width: width,
        child: TextFormField(
          style: style ?? CustomStyles.textStyle(fontSize: fontSize,fontColor: Theme.of(context).textTheme.bodySmall?.color,),
          controller: controller,
          expands: false,
          cursorColor: CustomColors.primary,
          inputFormatters: inputFormatter,
          maxLines: maxLines ?? 1,
          onChanged: onChange,
          onFieldSubmitted: onFieldSubmitted,
          onTap: onTap,
          enabled: enabled,
          keyboardType: keyboardType,
          readOnly: readOnly,
          textInputAction: textInputAction,
          autofocus: autofocus,
          textAlign: textAlign ?? TextAlign.start,
          obscureText: obscureText,
          validator: validator,
          maxLength: maxLength,
          obscuringCharacter: obscuringCharacter,
          textAlignVertical: TextAlignVertical.center,
          decoration: decoration ??
              InputDecoration(
                filled: filled,
                counterText: counter ? null : '',
                contentPadding: contentPadding,
                fillColor: fillColor,
                prefixIcon: prefixIcon == null ? null : Center(child: prefixIcon),
                suffixIcon: suffixIcon,
                suffixIconConstraints: BoxConstraints(maxWidth: 110),
                prefixIconConstraints: BoxConstraints(maxWidth: 40),
                enabledBorder: border ??
                    OutlineInputBorder(
                        borderSide:
                            BorderSide(color: borderColor, width: boderWidth),
                        borderRadius: BorderRadius.circular(radius)),
                disabledBorder: border ??
                    OutlineInputBorder(
                        borderSide: BorderSide(
                            color: borderColor.withOpacity(0.2),
                            width: boderWidth),
                        borderRadius: BorderRadius.circular(radius)),
                focusedBorder: border ??
                    OutlineInputBorder(
                        borderSide: BorderSide(
                            color: CustomColors.primary, width: boderWidth),
                        borderRadius: BorderRadius.circular(radius)),
                border: border ??
                    OutlineInputBorder(
                        borderSide: BorderSide(color: CustomColors.textColor)),
                // errorText: '',
                errorStyle: displayError
                    ? errorTextStyle ?? CustomStyles.textStyle(fontSize: 10)
                    : TextStyle(fontSize: 0),
                hintText: hint,
                isDense: isDense,
                hintStyle: hintStyle ??
                    TextStyle(
                      color: CustomColors.textFiledIconColor,
                      fontWeight: FontWeight.normal,
                      fontSize: fontSize ?? 15,
                    ),
              ),
        ),
      ),
    );
  }
}
