import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../const/constant.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
TextEditingController emailController  = TextEditingController();
TextEditingController passWordController  = TextEditingController();


  void onLogin() {
    if(emailController.text.isNotEmpty && passWordController.text.isNotEmpty) {
      Get.toNamed(Routes.HOME);
    }else {
        Get.snackbar(
          "",
          "Please enter email and password",
          colorText: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
          backgroundColor: primaryColor,
        );
    }
  }
}
