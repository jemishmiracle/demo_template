
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demo_template/custom_elements/custom_elements.dart';


class CustomText extends StatelessWidget {
  CustomText({required this.text, this.color,this.fontWeight,this.maxLines,this.fontSize,this.textAlign,this.textDecoration,this.fontStyle,this.fontFamily,this.overflow,this.textStyle});

  String text;
  Color? color;
  FontStyle? fontStyle;
  FontWeight? fontWeight;
  double? fontSize;
  int? maxLines;
  String? fontFamily;
  TextOverflow? overflow;
  TextAlign? textAlign;
  TextStyle? textStyle;
  TextDecoration? textDecoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.ellipsis,
      textAlign: textAlign,
      style: textStyle ?? CustomStyles.textStyle(
          fontSize: fontSize,
          fontColor: color,
          textDecoration: textDecoration,fontStyle:fontStyle,
          fontWeight: fontWeight ?? FontWeight.w400,
      ),
    );
  }
}
