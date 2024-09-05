
import 'package:demo_template/custom_elements/custom_elements.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class DialogHelper {
  static DeleteConfirmationDialog(String title,String message,{required VoidCallback onYes}) {
    return Alert(
      context: Get.context!,
      type: AlertType.warning,
      style: AlertStyle(
          constraints: BoxConstraints(minHeight: 200),
          overlayColor: CustomColors.text,
          alertBorder: RoundedRectangleBorder(
              side: BorderSide(color: CustomColors.primary),
              borderRadius: BorderRadius.circular(10)),
          backgroundColor: Get.theme.dialogBackgroundColor,
          titleStyle: TextStyle(
              color: Get.theme.textTheme.headlineLarge?.color,
              fontSize: 18
          ),
          descStyle: TextStyle(
              color: CustomColors.grey,
              fontSize: 14
          )
      ),
      title: title,
      desc: message,
      closeIcon: Icon(Icons.close),
      buttons: [
        DialogButton(
          child: CustomTitle(
            title: "No",
            fontColor: CustomColors.white,
            fontWeight: FontWeight.normal,
          ),
          onPressed: () => Get.back(),
          color: Colors.red,
        ),
        DialogButton(
          child: CustomTitle(
            title: "Yes",
            fontColor: CustomColors.white,
            fontWeight: FontWeight.normal,
          ),
          onPressed: () {
            Get.back();
            onYes.call();
          },
          color: Colors.green,
        ),
      ],
    ).show();
  }
  static Future showSelectTypeDialog(BuildContext context, {required Function(int) onTypeTap}) async {
    return  showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return ScaleTransition(
              scale: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
              child: FadeTransition(
                opacity: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
                child: AlertDialog(
                  contentPadding: EdgeInsets.zero,
                  content: Container(
                    color: CustomColors.white,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 8.h,
                          color: CustomColors.primary,
                          child: Center(
                            child: CustomText(
                              text: "Select Type",
                              color: CustomColors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(7.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () => onTypeTap(1),
                                child: Container(
                                  padding: EdgeInsets.all(4.w),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: CustomColors.primary),
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Icon(Icons.camera_alt,color: CustomColors.primary,size: 35,),
                                ),
                              ),
                              InkWell(
                                onTap: () => onTypeTap(2),
                                child: Container(
                                  padding: EdgeInsets.all(4.w),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: CustomColors.primary),
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Icon(Icons.photo,color: CustomColors.primary,size: 35,),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
        },
        transitionDuration: const Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {
          return Container();
        });
  }
}
