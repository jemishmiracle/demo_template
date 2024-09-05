
import 'package:demo_template/screens/auth/login_screen.dart';
import 'package:demo_template/screens/home/home_screen.dart';
import 'package:demo_template/screens/main_screen.dart';
import 'package:demo_template/screens/splash_screen.dart';
import 'package:get/get.dart';
import 'package:demo_template/route/routes.dart';

class Screens{

  static final routes = [
    GetPage(name: Routes.splashScreen, page: () =>  SplashScreen(),),
    GetPage(name: Routes.loginScreen, page: () =>  LoginScreen(),),
    GetPage(name: Routes.mainScreen, page: () =>  MainScreen(),),
    GetPage(name: Routes.homeScreen, page: () =>  HomeScreen(),),
  ];

}