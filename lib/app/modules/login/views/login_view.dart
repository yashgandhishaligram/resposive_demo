import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/responsive.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Container(
              height: size.height,
              width: size.width,
              decoration: const BoxDecoration(color: Colors.white70),
              child: Row(
                children: [
                  if (Responsive.isDesktop(context))
                    Expanded(
                      flex: 0,
                      child: Container(
                        width: size.width / 2,
                        height: double.maxFinite,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: const Color(0xFFFE6B68),
                            borderRadius: BorderRadius.circular(35)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/logo.png",
                              color: Colors.white,
                              width: 350,
                              height: 200,
                            ),
                            const Text(
                              "Chat GPT",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  Flexible(
                    child: Align(
                      alignment:  Alignment.center,
                      child: Container(
                        width: (Responsive.isMobile(context) ||
                                    Responsive.isTablet(context)) ? size.width / 1.0 : size.width /  5.0 ,
                        height: double.maxFinite,
                        margin: const EdgeInsets.symmetric(horizontal: 30),
                        decoration: BoxDecoration(
                          // color: const Color(0xFFFE6B68),
                            borderRadius: BorderRadius.circular(35)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (Responsive.isMobile(context) ||
                                Responsive.isTablet(context))
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Image.asset(
                                    "assets/images/logo.png",
                                    color: const Color(0xFFFE6B68),
                                    width: 350,
                                    height: 200,
                                  ),
                                  const Text(
                                    "Chat GPT",
                                    style: TextStyle(
                                        color: Color(0xFFFE6B68),
                                        fontSize: 40,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            const SizedBox(height: 40),
                            const Text(
                              "Hello Again!",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600),
                            ),
                            const Text(
                              "Welcome back  you”ve been missed!",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 30),
                            TextField(
                              controller: controller.emailController,
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(
                                          10)),
                                      borderSide: BorderSide(color: Color(
                                          0xFFFE6B68))),
                                  labelStyle: TextStyle(
                                      fontSize: 16,
                                      color: const Color(0xFFFE6B68).withOpacity(
                                          0.6)),
                                  labelText: 'Enter Email',
                                  hintText: 'Enter Your Email'),
                            ),
                            const SizedBox(height: 15),
                            TextField(
                              controller: controller.passWordController,
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide(color: Color(0xFFFE6B68))),
                                  labelStyle: TextStyle(
                                      fontSize: 16,
                                      color: const Color(0xFFFE6B68).withOpacity(
                                          0.6)),
                                  labelText: 'Enter Password',
                                  hintText: 'Enter Your Password'),
                            ),
                            const SizedBox(height: 28),
                            SizedBox(
                              height: 50,
                              width: double.maxFinite,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                      backgroundColor: const Color(0xFFFE6B68),
                                      padding: const EdgeInsets.all(9)),
                                  onPressed: () {
                                    controller.onLogin();
                                  },
                                  child: const Text(
                                    "Login",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  )),
                            ),
                            const SizedBox(height: 25),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Text(
                                    "----------  ",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Text(
                                  "Or continue with",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                Flexible(
                                  child: Text(
                                    "  ---------",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 25),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                socialButton("assets/images/google.png"),
                                socialButton("assets/images/twitter.png"),
                                socialButton("assets/images/facebook.png")
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Widget socialButton(String image) {
    return Flexible(
      child: Container(
          height: 50,
          width: 50,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            // image: DecorationImage(
            //   image: AssetImage(image)
            // ),
            borderRadius: BorderRadius.circular(4)
          ),
          child: Image.asset(image,width: 50,height: 50,fit: BoxFit.cover,)),
    );
  }
}
