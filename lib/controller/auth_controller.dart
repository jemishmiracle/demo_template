import 'package:demo_template/constants/constants.dart';
import 'package:demo_template/route/routes.dart';
import 'package:demo_template/services/http_service.dart';
import 'package:demo_template/utils/app_urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  HttpService httpService = HttpService();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool passVisibility = true.obs;

  login() async {
    Get.toNamed(Routes.mainScreen);
  }
}