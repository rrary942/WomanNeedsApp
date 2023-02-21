import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:woman_needs_app/app/data/controller/auth_controller.dart';
import 'package:woman_needs_app/app/routes/app_pages.dart';
import 'package:woman_needs_app/app/utils/style/AppColor.dart';
import 'package:woman_needs_app/app/utils/widget/header.dart';
import 'package:woman_needs_app/app/utils/widget/peopleYouMayKnow.dart';
import 'package:woman_needs_app/app/utils/widget/profile.dart';
import 'package:woman_needs_app/app/utils/widget/sideBar.dart';
import 'package:woman_needs_app/app/utils/widget/widgetTask.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _drawerKey,
        drawer: SizedBox(width: 150, child: const SideBar()),
        backgroundColor: AppColor.primaryBg,
        body: Row(
          children: [
            !context.isPhone
                ? const Expanded(
                    flex: 2,
                    child: SideBar(),
                  )
                : SizedBox(),
            Expanded(
              flex: 15,
              child: Column(
                children: [
                  !context.isPhone
                      ? const Header()
                      : Container(
                          padding: EdgeInsets.all(20),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  _drawerKey.currentState!.openDrawer();
                                },
                                icon: Icon(Icons.menu),
                                color: AppColor.primaryText,
                              ),
                              const SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Women Needs",
                                    style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.primaryText),
                                  ),
                                  Text(
                                    "share with us about your skincare",
                                    style: GoogleFonts.poppins(
                                        fontSize: 10,
                                        color: AppColor.primaryText),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              !context.isPhone
                                  ? Icon(
                                      Ionicons.notifications,
                                      color: AppColor.primaryText,
                                    )
                                  : SizedBox(),
                              const SizedBox(width: 15),
                              !context.isPhone
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: const CircleAvatar(
                                        backgroundColor: Colors.amberAccent,
                                        radius: 25,
                                        foregroundImage: NetworkImage(
                                            'https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-PNG-Photos.png'),
                                      ),
                                    )
                                  : GestureDetector(
                                      onTap: () {
                                        Get.defaultDialog(
                                            title: "Sign Out",
                                            content: const Text(
                                                "Are You Sure Want To Sign Out?"),
                                            cancel: ElevatedButton(
                                              onPressed: () => Get.back(),
                                              child: const Text("Cancel"),
                                            ),
                                            confirm: ElevatedButton(
                                                onPressed: () => authC.logout(),
                                                child: const Text("Sign Out")));
                                      },
                                      child: Row(
                                        children: [
                                          Text(
                                            "Log Out",
                                            style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: AppColor.primaryText),
                                          ),
                                          const SizedBox(width: 5),
                                          const Icon(
                                            Ionicons.log_out_outline,
                                            color: AppColor.primaryText,
                                            size: 30,
                                          ),
                                        ],
                                      ),
                                    ),
                            ],
                          ),
                        ),
                  Expanded(
                    child: Container(
                      padding: !context.isPhone
                          ? const EdgeInsets.all(25)
                          : const EdgeInsets.all(20),
                      margin: !context.isPhone
                          ? const EdgeInsets.only(
                              top: 30, left: 16, right: 16, bottom: 16)
                          : const EdgeInsets.only(
                              top: 30, left: 0, right: 0, bottom: 0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProfileWidget(),
                          // Text(
                          //   "People You May Know",
                          //   style: GoogleFonts.poppins(
                          //       fontSize: 24, color: AppColor.primaryText),
                          // ),
                          // const SizedBox(
                          //   height: 8,
                          // ),
                          SizedBox(
                            height: 225,
                            child: WidgetTask(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
