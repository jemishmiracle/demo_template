
import 'package:demo_template/utils/hive_store_util.dart';
import 'package:get/get.dart';

class DarkController extends GetxController{
  bool isDarkMode = false;

  @override
  void onInit() {
    isDarkMode = HiveStoreUtil.getBool(HiveStoreUtil.darkModeKey);
    update();
    super.onInit();
  }
}

