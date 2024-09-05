import 'package:demo_template/localization/hi.dart';
import 'package:get/get.dart';
import 'en.dart';
import 'gu.dart';

class LocalizationService extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': En().values,
    'gu': Gu().values,
    'hi': Hi().values,
  };
}

String getLanguageName(code) => code == "en" ? "English" : "Gujarati";