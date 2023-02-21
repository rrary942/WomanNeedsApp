import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:woman_needs_app/app/data/controller/auth_controller.dart';
import 'package:woman_needs_app/app/routes/app_pages.dart';
import 'package:woman_needs_app/app/utils/style/AppColor.dart';

class MyFriends extends StatelessWidget {
  final authCon = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "My Friends",
                    style: GoogleFonts.poppins(
                        fontSize: 18, color: AppColor.primaryText),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.FRIENDS),
                    child: Text(
                      "More",
                      style: GoogleFonts.poppins(
                          fontSize: 18, color: AppColor.primaryText),
                    ),
                  ),
                  const Icon(
                    Ionicons.arrow_forward,
                    color: AppColor.primaryText,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                stream: authCon.streamFriends(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  var myFriends = (snapshot.data!.data()
                      as Map<String, dynamic>)['emailFriends'] as List;

                  return GridView.builder(
                    shrinkWrap: true,
                    itemCount: myFriends.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: context.isPhone ? 2 : 3,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20),
                    itemBuilder: (context, index) {
                      return StreamBuilder<
                              DocumentSnapshot<Map<String, dynamic>>>(
                          stream: authCon.streamUsers(myFriends[index]),
                          builder: (context, snapshot2) {
                            if (snapshot2.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                            var data = snapshot2.data!.data();

                            return Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(35),
                                  child: CircleAvatar(
                                    radius: 50,
                                    foregroundImage:
                                        NetworkImage(data!['photo']),
                                  ),
                                ),
                                Text(
                                  data['name'],
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            );
                          });
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
