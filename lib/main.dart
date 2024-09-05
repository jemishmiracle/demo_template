import 'package:country_code_picker/country_code_picker.dart';
import 'package:demo_template/controller/dark_Controller.dart';
import 'package:demo_template/route/routes.dart';
import 'package:demo_template/route/screens.dart';
import 'package:demo_template/theme/theme_data.dart';
import 'package:demo_template/utils/hive_store_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'custom_elements/custom_elements.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('Demo Template');

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  DarkController controller = Get.put(DarkController());

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        title: 'Demo Template',
        debugShowCheckedModeBanner: false,
        getPages: Screens.routes,
        initialRoute: Routes.splashScreen,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: HiveStoreUtil.getBool(HiveStoreUtil.darkModeKey) ? ThemeMode.dark : ThemeMode.light,
        builder: EasyLoading.init(),
        supportedLocales: const [
          Locale("en"),
          Locale("hi"),
          Locale("gu"),
        ],
        localizationsDelegates: const [
          CountryLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
      );
    },);
  }
}

