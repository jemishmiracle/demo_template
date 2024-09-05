import 'package:demo_template/utils/extentions.dart';
import 'package:demo_template/custom_elements/custom_elements.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  double? fontSize;
  Color? fontColor;
  EdgeInsets? padding;
  double? radius;
  Function onTap;
  Color bgColor;
  double elevation;
  Color fgColor;
  Color pressedColor;
  String title;
  double borderWidth;
  Color borderColor;
  Size? size;
  bool shrink;
  ButtonStyle? btnStyle;

  CustomButton(
      {super.key, required this.title,
      this.radius,
        this.borderWidth = 0,
      this.borderColor = Colors.transparent,
      this.fontColor,
      this.padding,
      this.fontSize,
      required this.onTap,
      this.bgColor = CustomColors.primary,
      this.elevation = 4,
      this.pressedColor = CustomColors.primary,
      this.size,
        this.shrink = false,
      this.fgColor = CustomColors.white,
      this.btnStyle});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onTap(),
      clipBehavior: Clip.antiAlias,
      style: btnStyle ?? ButtonStyle(
          backgroundColor: MaterialStateProperty.all(bgColor),
          foregroundColor: MaterialStateProperty.all(fgColor),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          side: MaterialStateProperty.all(BorderSide(color: borderColor,style: BorderStyle.solid,width: borderWidth)),
          elevation: MaterialStateProperty.all(elevation),
          shadowColor: MaterialStateProperty.all(bgColor),
          padding: MaterialStateProperty.all(padding ?? const EdgeInsets.symmetric(horizontal: 10,vertical: 5)),
          overlayColor: MaterialStateProperty.all(pressedColor),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius ?? 10))),
          animationDuration: const Duration(milliseconds: 500),
          splashFactory: InkSplash.splashFactory,
        maximumSize: shrink ? null : MaterialStateProperty.all(size ?? (Size(SizerUtil.deviceType.isMobile() ? 90.w : 400, 50)) ),
        minimumSize: shrink ? null : MaterialStateProperty.all(size ?? (Size(SizerUtil.deviceType.isMobile() ? 90.w : 400, 50))),
          visualDensity: VisualDensity.standard,
          // padding: WidgetStateProperty.all(EdgeInsets.all(20)),
          // surfaceTintColor:  WidgetStateProperty.all(Colors.greenAccent)
      ),
      child: Text(title,style: CustomStyles.textStyle(fontSize:  fontSize ?? 18,fontColor: fontColor,fontWeight: FontWeight.bold),),
    );
  }
}

class CustomButton2 extends StatelessWidget {
  double? fontSize;
  Color? fontColor;
  EdgeInsets? padding;
  double? radius;
  Function onTap;
  Color? bgColor;
  double elevation;
  String title;
  double borderWidth;
  Color borderColor;
  double? height;
  double? width;
  Gradient? gradient;

  CustomButton2(
      {super.key,
        required this.title,
        this.radius,
        this.borderWidth = 0,
        this.borderColor = Colors.transparent,
        this.fontColor = Colors.white,
        this.padding,
        this.fontSize,
        required this.onTap,
        this.bgColor,
        this.elevation = 4,
        this.height,
        this.width,
        this.gradient,
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        height: height ?? 50,
        width: width ?? SizerUtil.deviceType.isMobile() ? 90.w : 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 13),
          color: bgColor,
          border: Border.all(color: borderColor,width: borderWidth),
          gradient: gradient ?? LinearGradient(colors: [
            CustomColors.btnColor,
            CustomColors.primary,
          ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(child: Text(title,style: CustomStyles.textStyle(fontSize:  fontSize ?? 18,fontColor: fontColor,fontWeight: FontWeight.w700),)),
      ),
    );
  }
}
