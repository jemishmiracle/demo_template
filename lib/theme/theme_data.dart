import 'package:flutter/material.dart';
import 'package:demo_template/custom_elements/custom_elements.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
     scaffoldBackgroundColor: CustomColors.white,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: CustomColors.white,
    ),
    textTheme: const TextTheme(
        labelLarge:  TextStyle(color: CustomColors.primary),
        labelMedium: TextStyle(color: CustomColors.textColor2,fontFamily: 'Poppins'),
        labelSmall:  TextStyle(color: CustomColors.textColor2,fontFamily: 'Poppins'),
        bodySmall:  TextStyle(color: CustomColors.black,fontFamily: 'Poppins'),
        bodyMedium:  TextStyle(color: CustomColors.textFiledIconColor,fontFamily: 'Poppins'),
        bodyLarge:  TextStyle(color: CustomColors.redColor,fontFamily: 'Poppins'),
       displayLarge: TextStyle(color: CustomColors.grey,fontFamily: 'Poppins'),
       displayMedium: TextStyle(color: CustomColors.textColor1,fontFamily: 'Poppins'),
       displaySmall: TextStyle(color: CustomColors.white),
       headlineSmall: TextStyle(color: CustomColors.grey),
    ),
    buttonTheme: const ButtonThemeData(
        buttonColor: CustomColors.primary,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: CustomColors.textFieldColor,
      suffixIconColor: CustomColors.textFiledIconColor,
      prefixIconColor: CustomColors.textFiledIconColor,
        hintStyle: TextStyle(color: CustomColors.textFiledIconColor)
    )
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: CustomColors.black,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: CustomColors.white
    ),
    textTheme: const TextTheme(
        labelLarge: TextStyle(color: CustomColors.white),
      labelMedium: TextStyle(color: CustomColors.primary,fontFamily: 'Poppins'),
      labelSmall: TextStyle(color: CustomColors.white,fontFamily: 'Poppins'),
      bodySmall: TextStyle(color: CustomColors.white,fontFamily: 'Poppins'),
      bodyMedium: TextStyle(color: CustomColors.white,fontFamily: 'Poppins'),
      bodyLarge: TextStyle(color: CustomColors.redColor,fontFamily: 'Poppins'),
      displayLarge: TextStyle(color: CustomColors.white,fontFamily: 'Poppins'),
      displayMedium: TextStyle(color: CustomColors.white,fontFamily: 'Poppins'),
      displaySmall: TextStyle(color: CustomColors.primary),
      headlineSmall: TextStyle(color: CustomColors.black),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: CustomColors.white,
    ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: CustomColors.text,
        suffixIconColor: CustomColors.white,
        prefixIconColor: CustomColors.white,
        hintStyle: TextStyle(color: CustomColors.white,),
      ),

  );
}

class AppTextStyle {
  static InputDecoration vTextInput(context) => InputDecoration(
    isDense: true,
    border: OutlineInputBorder(
      borderSide: BorderSide(color: CustomColors.textColor,width: 1),
      borderRadius: BorderRadius.circular(10),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: CustomColors.checkBoxColor,width: 1),
      borderRadius: BorderRadius.circular(10),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color:  CustomColors.redColor,width: 1),
      borderRadius: BorderRadius.circular(10),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color:  CustomColors.checkBoxColor,width: 1),
      borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color:  CustomColors.primary,width: 1),
      borderRadius: BorderRadius.circular(10),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color:  CustomColors.checkBoxColor,width: 1),
      borderRadius: BorderRadius.circular(10),
    ),
    // errorStyle: ,
  );
  static ButtonStyle vBtnStyle = ButtonStyle(
    backgroundColor: MaterialStatePropertyAll(CustomColors.primary),
  );
}