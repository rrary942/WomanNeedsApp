import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:woman_needs_app/app/data/controller/auth_controller.dart';
import 'package:woman_needs_app/app/utils/style/AppColor.dart';

class ProfileWidget extends StatelessWidget {
  final authCon = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: !context.isPhone
          ? Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ClipRRect(
                    child: CircleAvatar(
                      backgroundColor: Colors.amberAccent,
                      radius: 120,
                      foregroundImage:
                          NetworkImage(authCon.auth.currentUser!.photoURL!),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        authCon.auth.currentUser!.displayName!,
                        style: GoogleFonts.poppins(
                            fontSize: 24, color: AppColor.primaryText),
                      ),
                      Text(
                        authCon.auth.currentUser!.email!,
                        style: GoogleFonts.poppins(
                            fontSize: 12, color: AppColor.primaryText),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  ClipRRect(
                    child: CircleAvatar(
                      backgroundColor: Colors.amberAccent,
                      radius: 120,
                      foregroundImage:
                          NetworkImage(authCon.auth.currentUser!.photoURL!),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    authCon.auth.currentUser!.displayName!,
                    style: GoogleFonts.poppins(
                        fontSize: 24, color: AppColor.primaryText),
                  ),
                  Text(
                    authCon.auth.currentUser!.email!,
                    style: GoogleFonts.poppins(
                        fontSize: 12, color: AppColor.primaryText),
                  ),
                ],
              ),
            ),
    );
  }
}
