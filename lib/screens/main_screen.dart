import 'package:demo_template/controller/home_controller.dart';
import 'package:demo_template/custom_elements/custom_elements.dart';
import 'package:demo_template/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(seconds: 1),
        child: PageView(
          controller: controller.pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (value) {
            controller.selectedItemPosition.value = value;
          },
          children: [
            HomeScreen(),
            HomeScreen(),
            HomeScreen(),
          ],
        ),
      ),
      bottomNavigationBar: Obx(() => Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15),),
          boxShadow: [
            BoxShadow(color: Colors.grey,blurRadius: 2),
          ],
          color: Colors.white,
        ),
        child: FloatingNavbar(
          borderRadius: 10,
          fontSize: 14,
          elevation: 5.0,
          backgroundColor: Colors.white,
          selectedBackgroundColor: CustomColors.primary,
          unselectedItemColor: CustomColors.iconColor,
          selectedItemColor: CustomColors.white,
          padding: EdgeInsets.zero,
          onTap: (int val) {
            controller.selectedItemPosition.value = val;
            controller.pageController.jumpToPage(val);
          },
          currentIndex: controller.selectedItemPosition.value,
          items: [
            FloatingNavbarItem(
              icon: Icons.home,
              title: 'Home',
            ),
            FloatingNavbarItem(
              icon: Icons.settings,
              title: 'Setting',
            ),
            FloatingNavbarItem(
              icon: Icons.person,
              title: 'Profile',
            ),
          ],
        ),
      ),),
    );
  }
}
