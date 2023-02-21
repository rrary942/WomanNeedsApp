import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:woman_needs_app/app/utils/style/AppColor.dart';
import 'package:woman_needs_app/app/utils/widget/header.dart';
import 'package:woman_needs_app/app/utils/widget/sideBar.dart';

class UpcomingTask extends StatelessWidget {
  const UpcomingTask({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Upcoming Task",
                style: GoogleFonts.poppins(
                    fontSize: 18, color: AppColor.primaryText),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 400,
                child: ListView(
                  clipBehavior: Clip.antiAlias,
                  // scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        color: AppColor.primaryCard,
                      ),
                      margin: EdgeInsets.all(16),
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: const CircleAvatar(
                                  backgroundColor: Colors.amberAccent,
                                  radius: 25,
                                  foregroundImage: NetworkImage(
                                      'https://static.vecteezy.com/system/resources/previews/002/275/847/original/male-avatar-profile-icon-of-smiling-caucasian-man-vector.jpg'),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: const CircleAvatar(
                                  backgroundColor: Colors.amberAccent,
                                  radius: 25,
                                  foregroundImage: NetworkImage(
                                      'https://static.vecteezy.com/system/resources/previews/002/275/847/original/male-avatar-profile-icon-of-smiling-caucasian-man-vector.jpg'),
                                ),
                              ),
                              Spacer(),
                              Container(
                                height: 25,
                                width: 80,
                                color: AppColor.primaryBg,
                                child: Center(
                                  child: Text(
                                    "100%",
                                    style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        color: AppColor.primaryText),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Container(
                            height: 25,
                            width: 80,
                            color: AppColor.primaryBg,
                            child: Center(
                              child: Text(
                                "10 / 10 Task",
                                style: GoogleFonts.poppins(
                                    fontSize: 12, color: AppColor.primaryText),
                              ),
                            ),
                          ),
                          Text(
                            "Flutter Class",
                            style: GoogleFonts.poppins(
                                fontSize: 20, color: AppColor.primaryText),
                          ),
                          Text(
                            "Deadline 2 Jam Lagi",
                            style: GoogleFonts.poppins(
                                fontSize: 12, color: AppColor.primaryText),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        color: AppColor.primaryCard,
                      ),
                      margin: EdgeInsets.all(16),
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: const CircleAvatar(
                                  backgroundColor: Colors.amberAccent,
                                  radius: 25,
                                  foregroundImage: NetworkImage(
                                      'https://static.vecteezy.com/system/resources/previews/002/275/847/original/male-avatar-profile-icon-of-smiling-caucasian-man-vector.jpg'),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: const CircleAvatar(
                                  backgroundColor: Colors.amberAccent,
                                  radius: 25,
                                  foregroundImage: NetworkImage(
                                      'https://static.vecteezy.com/system/resources/previews/002/275/847/original/male-avatar-profile-icon-of-smiling-caucasian-man-vector.jpg'),
                                ),
                              ),
                              Spacer(),
                              Container(
                                height: 25,
                                width: 80,
                                color: AppColor.primaryBg,
                                child: Center(
                                  child: Text(
                                    "100%",
                                    style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        color: AppColor.primaryText),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Container(
                            height: 25,
                            width: 80,
                            color: AppColor.primaryBg,
                            child: Center(
                              child: Text(
                                "10 / 10 Task",
                                style: GoogleFonts.poppins(
                                    fontSize: 12, color: AppColor.primaryText),
                              ),
                            ),
                          ),
                          Text(
                            "Flutter Class",
                            style: GoogleFonts.poppins(
                                fontSize: 20, color: AppColor.primaryText),
                          ),
                          Text(
                            "Deadline 2 Jam Lagi",
                            style: GoogleFonts.poppins(
                                fontSize: 12, color: AppColor.primaryText),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        color: AppColor.primaryCard,
                      ),
                      margin: EdgeInsets.all(16),
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: const CircleAvatar(
                                  backgroundColor: Colors.amberAccent,
                                  radius: 25,
                                  foregroundImage: NetworkImage(
                                      'https://static.vecteezy.com/system/resources/previews/002/275/847/original/male-avatar-profile-icon-of-smiling-caucasian-man-vector.jpg'),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: const CircleAvatar(
                                  backgroundColor: Colors.amberAccent,
                                  radius: 25,
                                  foregroundImage: NetworkImage(
                                      'https://static.vecteezy.com/system/resources/previews/002/275/847/original/male-avatar-profile-icon-of-smiling-caucasian-man-vector.jpg'),
                                ),
                              ),
                              Spacer(),
                              Container(
                                height: 25,
                                width: 80,
                                color: AppColor.primaryBg,
                                child: Center(
                                  child: Text(
                                    "100%",
                                    style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        color: AppColor.primaryText),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Container(
                            height: 25,
                            width: 80,
                            color: AppColor.primaryBg,
                            child: Center(
                              child: Text(
                                "10 / 10 Task",
                                style: GoogleFonts.poppins(
                                    fontSize: 12, color: AppColor.primaryText),
                              ),
                            ),
                          ),
                          Text(
                            "Flutter Class",
                            style: GoogleFonts.poppins(
                                fontSize: 20, color: AppColor.primaryText),
                          ),
                          Text(
                            "Deadline 2 Jam Lagi",
                            style: GoogleFonts.poppins(
                                fontSize: 12, color: AppColor.primaryText),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
