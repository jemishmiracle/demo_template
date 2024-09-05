import 'package:flutter/material.dart';
import 'package:demo_template/custom_elements/custom_elements.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  double? fontSize;
  Color? fontColor;
  FontWeight? fontWeight;
  int? maxLines;
  TextOverflow? overflow;
  TextAlign? textAlign;

  CustomTitle({required this.title, this.fontSize,this.fontColor,this.textAlign,this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(title,
        maxLines: maxLines,
        textAlign: textAlign,
        overflow: overflow ?? TextOverflow.ellipsis,
        style: CustomStyles.textStyle(
            fontSize: fontSize ?? (22),
            fontColor: fontColor ?? Colors.white,
            fontWeight: fontWeight ?? FontWeight.bold,
        )
      //TextStyle(color: uiColors.title, fontSize:  animate ?? false ? size.value : tempsize),
    );
  }
}
