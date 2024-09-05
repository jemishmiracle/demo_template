import 'package:flutter/material.dart';
import 'package:demo_template/custom_elements/custom_elements.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{

  String? title;
  Widget? customTitle;
  double? height;
  double? iconSize;
  Function? prefixAction;
  Function? suffixAction;
  Widget? prefixIcon;
  Widget? suffixIcon;
  bool isSafeArea;
  bool showArrow;
  Color? textColor;

   CustomAppBar({Key? key, this.title,this.height,this.prefixAction,this.suffixIcon,this.prefixIcon,this.suffixAction,this.iconSize,this.customTitle,this.isSafeArea = true,this.showArrow = false,this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: isSafeArea ? EdgeInsets.only(top: MediaQuery.of(context).padding.top) : EdgeInsets.zero,
      child: Container(
        height: height ?? preferredSize.height,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  <Widget>[
              showArrow ?
              InkWell(
                onTap:  () => prefixAction != null ? prefixAction!() : Navigator.pop(context),
                child: prefixIcon ?? Icon(Icons.arrow_back_ios,size: 25,color: Colors.white,),
              ) : Padding(padding: EdgeInsets.only(left: 30)),
              Expanded(child:Padding(
                padding: EdgeInsets.only(right: 30),
                child: Center(child: customTitle ??  CustomTitle(title: title ?? '',fontColor: textColor ?? Colors.black,fontWeight: FontWeight.w600,textAlign: TextAlign.center,)),
              )),
              InkWell(
                onTap:  ()=> suffixAction != null ? suffixAction!() : null,
                child: suffixIcon ?? SizedBox(),
              ),
            ]),
      ),
    );
  }

  @override
  Size get preferredSize => Size(100.w, height ?? (8.h));
}
