import 'package:demo_template/controller/auth_controller.dart';
import 'package:demo_template/custom_elements/custom_elements.dart';
import 'package:demo_template/route/routes.dart';
import 'package:demo_template/utils/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  AuthController controller = Get.put(AuthController());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Login',
      ),
      body: Padding(
        padding: EdgeInsets.only(top: Get.mediaQuery.padding.top,left: 20,right: 20),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                    controller: controller.emailController,
                    hint: 'Enter Email',
                    prefixIcon: Center(child: const Icon(Icons.email_outlined,)),
                    validator: (val) {
                      if (!Utils.isValidEmail(val)) {
                        return "Enter Valid Email Address";
                      }
                      return null;
                    },
                ),
                const SizedBox(height: 20,),
                Obx(() => CustomTextField(
                  controller: controller.passwordController,
                  hint: 'Enter Password',
                  prefixIcon: Center(child: const Icon(Icons.lock,)),
                  keyboardType: TextInputType.number,
                  obscuringCharacter: "*",
                  obscureText: controller.passVisibility.value,
                  maxLength: 6,
                  validator: (val) {
                    if (val!.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    return null;
                  },
                  suffixIcon: IconButton(
                    onPressed: () => controller.passVisibility.value = !controller.passVisibility.value,
                    icon: controller.passVisibility.value ? const Icon(Icons.visibility_off,) :const Icon(Icons.visibility,),
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(5.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomButton(
                title: 'Log In',
                onTap: () {
                  if(formKey.currentState!.validate()){
                    controller.login();
                  }
                }
            ),
            SizedBox(height: 4.w),
            Center(
              child: RichText(
                text: TextSpan(
                  text: "Don't have account?  ",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                  children: [
                    TextSpan(
                      text: 'Sign Up',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: CustomColors.primary,fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()..onTap = () => Get.toNamed(Routes.homeScreen),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
