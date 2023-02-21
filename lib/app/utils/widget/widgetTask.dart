import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:woman_needs_app/app/modules/task/controllers/task_controller.dart';
import 'package:woman_needs_app/app/utils/style/AppColor.dart';
import 'package:woman_needs_app/app/utils/widget/header.dart';
import 'package:woman_needs_app/app/utils/widget/prosesTask.dart';
import 'package:woman_needs_app/app/utils/widget/sideBar.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:woman_needs_app/app/data/controller/auth_controller.dart';

class WidgetTask extends StatelessWidget {
  final controller = Get.find<TaskController>();
  final authCon = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TaskController());
    final authCon = Get.find<AuthController>();
    return Expanded(
      child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: authCon.streamUsers(authCon.auth.currentUser!.email!),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            var taskId = (snapshot.data!.data()
                as Map<String, dynamic>)['task_id'] as List;
            return ListView.builder(
              itemCount: taskId.length,
              itemBuilder: (context, index) {
                return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                    stream: authCon.streamTask(taskId[index]),
                    builder: (context, snapshot2) {
                      if (snapshot2.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      //data task
                      var dataTask = snapshot2.data!.data();

                      //data foto user
                      var dataUserList = (snapshot2.data!.data()
                          as Map<String, dynamic>)['asign_to'] as List;

                      return GestureDetector(
                        onLongPress: () {
                          Get.defaultDialog(
                              title: dataTask['titel'],
                              content: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton.icon(
                                    onPressed: () {
                                      Get.back();
                                      controller.titleController.text =
                                          dataTask['titel'];
                                      controller.descriptionController.text =
                                          dataTask['description'];
                                      controller.dueDateController.text =
                                          dataTask['dueDate'];
                                      addEditTask(
                                          context: context,
                                          type: 'Update',
                                          docId: taskId[index]);
                                    },
                                    icon: const Icon(Ionicons.pencil),
                                    label: Text(
                                      'Update',
                                      style: GoogleFonts.poppins(),
                                    ),
                                  ),
                                  TextButton.icon(
                                    onPressed: () {
                                      controller.deleteTask(taskId[index]);
                                    },
                                    icon: const Icon(Ionicons.trash),
                                    label: Text(
                                      'Delete',
                                      style: GoogleFonts.poppins(),
                                    ),
                                  ),
                                ],
                              ));
                          // addEditTask(
                          //     context: context,
                          //     type: 'Update',
                          //     docId: taskId[index]);
                        },
                        child: Container(
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
                                  SizedBox(
                                    height: 50,
                                    child: Expanded(
                                      child: ListView.builder(
                                        padding: EdgeInsets.zero,
                                        itemCount: dataUserList.length,
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        physics: const ScrollPhysics(),
                                        itemBuilder: (context, index2) {
                                          return StreamBuilder<
                                              DocumentSnapshot<
                                                  Map<String, dynamic>>>(
                                            stream: authCon.streamUsers(
                                                dataUserList[index2]),
                                            builder: (context, snapshot3) {
                                              if (snapshot3.connectionState ==
                                                  ConnectionState.waiting) {
                                                return const Center(
                                                    child:
                                                        CircularProgressIndicator());
                                              }
                                              //data user photo
                                              var dataUserImage =
                                                  snapshot3.data!.data();
                                              return ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  child: Image.network(
                                                      dataUserImage!['photo'])
                                                  //     Image(
                                                  //   color: Colors
                                                  //       .amberAccent,
                                                  //   image: NetworkImage(
                                                  //       dataUserImage!['photo']),
                                                  // ),
                                                  );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    height: 25,
                                    width: 80,
                                    color: AppColor.primaryCard,
                                    child: Center(
                                      child: Text(
                                        '${dataTask!['status']}%',
                                        style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            color: AppColor.primaryCard),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 10,
                                width: 20,
                                color: AppColor.primaryCard,
                                child: Center(
                                  child: Text(
                                    '${dataTask['total_task_finished']} / ${dataTask['total_task']} Task',
                                    style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        color: AppColor.primaryCard),
                                  ),
                                ),
                              ),
                              Text(
                                dataTask['titel'],
                                style: GoogleFonts.poppins(
                                    fontSize: 20, color: AppColor.primaryText),
                              ),
                              Expanded(
                                child: Text(
                                  dataTask['description'],
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: AppColor.primaryText),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
              clipBehavior: Clip.antiAlias,
              // scrollDirection: Axis.vertical,
              shrinkWrap: true,
            );
          }),
    );
  }
}
