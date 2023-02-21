import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:woman_needs_app/app/data/controller/auth_controller.dart';
import 'package:woman_needs_app/app/modules/task/controllers/task_controller.dart';
import 'package:woman_needs_app/app/modules/task/views/task_view.dart';
import 'package:woman_needs_app/app/utils/style/AppColor.dart';
import 'package:woman_needs_app/app/utils/widget/header.dart';
import 'package:woman_needs_app/app/utils/widget/myFriends.dart';
import 'package:woman_needs_app/app/utils/widget/peopleYouMayKnow.dart';
import 'package:woman_needs_app/app/utils/widget/sideBar.dart';
import 'package:woman_needs_app/app/utils/widget/upcomingTask.dart';
import 'package:woman_needs_app/app/utils/widget/widgetTask.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(TaskController());
    final controller = Get.find<TaskController>();
    final authCon = Get.find<AuthController>();
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
                              const Icon(
                                Ionicons.notifications,
                                color: AppColor.primaryText,
                              ),
                              SizedBox(width: 15),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: CircleAvatar(
                                  backgroundColor: Colors.amberAccent,
                                  radius: 25,
                                  foregroundImage: NetworkImage(
                                      authCon.auth.currentUser!.photoURL!),
                                ),
                              ),
                            ],
                          ),
                        ),
                  Expanded(
                    child: Container(
                      padding: !context.isPhone
                          ? const EdgeInsets.all(20)
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
                      child: SizedBox(
                        height: Get.height * 0.3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "People Active",
                                    style: GoogleFonts.poppins(
                                        fontSize: 24,
                                        color: AppColor.primaryText),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  // UpcomingTask(),
                                  // MyFriends(),
                                  PeopleYouMayKnow(),
                                ],
                              ),
                            ),
                            !context.isPhone
                                ? Expanded(
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // Text(
                                            //   "Brands",
                                            //   style: GoogleFonts.poppins(
                                            //       fontSize: 24,
                                            //       color: AppColor.primaryText),
                                            // ),
                                          ],
                                        ),
                                        WidgetTask()
                                      ],
                                    ),
                                  )
                                : Expanded(
                                    child: SafeArea(
                                      child: SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            SizedBox(
                                              height: 400,
                                              width: double.infinity,
                                              child: ListView(
                                                clipBehavior: Clip.antiAlias,
                                                // scrollDirection: Axis.vertical,
                                                shrinkWrap: true,
                                                children: [
                                                  Text(
                                                    "Brands",
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 24,
                                                        color: AppColor
                                                            .primaryText),
                                                  ),
                                                  WidgetTask()
                                                  // TaskWidget(
                                                  //     authCon: authCon,
                                                  //     controller: controller)
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                            // WidgetTask(),
                          ],
                        ),
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
