import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:woman_needs_app/app/data/controller/auth_controller.dart';
import 'package:woman_needs_app/app/routes/app_pages.dart';
import 'package:hexcolor/hexcolor.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: !context.isPhone ? HexColor("#D97676") : Colors.white,
        body: Container(
          margin: context.isPhone
              ? EdgeInsets.all(Get.width * 0.1)
              : EdgeInsets.all(Get.height * 0.1),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white),
          child: Row(
            children: [
              //biru
              !context.isPhone
                  ? Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20)),
                            color: HexColor("#EED8D8")),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Welcome",
                                style: GoogleFonts.poppins(
                                    fontSize: 45, color: Colors.white),
                              ),
                              Text(
                                "Please Sign In",
                                style: GoogleFonts.poppins(
                                    fontSize: 20, color: Colors.white),
                              ),
                              Text(
                                "Start Journey With Us",
                                style: GoogleFonts.poppins(
                                    fontSize: 12, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
              //putih
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      context.isPhone
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Welcome To",
                                  style: GoogleFonts.poppins(
                                      fontSize: 30,
                                      color: HexColor("D97676"),
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Woman Needs",
                                  style: GoogleFonts.poppins(
                                      fontSize: 30,
                                      color: HexColor("D97676"),
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          : SizedBox(),
                      Image.asset(
                        'assets/login.png',
                        height: Get.height * 0.5,
                      ),
                      FloatingActionButton.extended(
                        backgroundColor: HexColor("#D97676"),
                        onPressed: () => authC.signInWithGoogle(),
                        label: Text(
                          "Sign in with Google",
                          style: GoogleFonts.poppins(),
                        ),
                        icon: const Icon(
                          Ionicons.logo_google,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
