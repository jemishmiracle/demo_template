import 'package:flutter/material.dart';
import 'dart:developer' as d;

///  this file contains all constant value that are used in other app.
///  it helps to centralize all constant values.

const DEBUG = true;
const InDevelopment = true;
const defaultFontFamily = null;
List<Locale> supportedLocales = const [
  Locale('en'),
  Locale('gu'),
];

void printLog(String val){
  if(DEBUG) d.log(val);
}

void printErrorLog(String val) {
  if (DEBUG) d.log(val);
}

bool checkResponse(int? code){
  return code == 200 ? true : false;
}