import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo_template/constants/image_path.dart';
import 'package:demo_template/route/routes.dart';
import 'package:demo_template/utils/hive_store_util.dart'; 

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void initState() {
    Future.delayed(Duration(seconds: 2),() {
        if(HiveStoreUtil.getString(HiveStoreUtil.accessTokenKey).isEmpty){
          Get.offNamed(Routes.loginScreen);
        } else {
          Get.offNamed(Routes.mainScreen);
        }
    },);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(ImagePath.imgLogo,width: 150,height: 150,),
      ), 
    );
  }
}
