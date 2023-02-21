import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:woman_needs_app/app/data/controller/auth_controller.dart';
import 'package:woman_needs_app/app/utils/style/AppColor.dart';
import 'package:woman_needs_app/app/utils/widget/header.dart';
import 'package:woman_needs_app/app/utils/widget/myFriends.dart';
import 'package:woman_needs_app/app/utils/widget/sideBar.dart';

class PeopleYouMayKnow extends StatelessWidget {
  final authCon = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
        future: authCon.getPeople(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          var data = snapshot.data!.docs;

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            clipBehavior: Clip.antiAlias,
            itemCount: data.length,
            itemBuilder: (context, index) {
              var hasil = data[index].data();
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(35),
                      child: Image(
                        image: NetworkImage(hasil['photo']),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: Text(
                        hasil['name'],
                        style: GoogleFonts.poppins(
                            fontSize: 14, color: Colors.white),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: SizedBox(
                        height: 35,
                        width: 35,
                        child: ElevatedButton(
                          onPressed: () => authCon.addFriends(hasil['email']),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(90),
                            ),
                          ),
                          child: const Icon(Ionicons.add_circle_outline),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
