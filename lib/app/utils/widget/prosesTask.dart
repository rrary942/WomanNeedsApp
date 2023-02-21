import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:woman_needs_app/app/modules/task/controllers/task_controller.dart';
import 'package:woman_needs_app/app/utils/style/AppColor.dart';
import 'package:woman_needs_app/app/utils/widget/header.dart';
import 'package:woman_needs_app/app/utils/widget/sideBar.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:woman_needs_app/app/data/controller/auth_controller.dart';

addEditTask({BuildContext? context, String? type, String? docId}) {
  // final controller = Get.find<TaskController>();
  final controller = Get.put(TaskController());

  Get.bottomSheet(
    SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16),
        margin: context!.isPhone
            ? EdgeInsets.zero
            : EdgeInsets.only(right: 150, left: 150),
        height: Get.height,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: Colors.white,
        ),
        child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                Text(
                  '$type Review',
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryText),
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: controller.titleController,
                  decoration: InputDecoration(
                    hintText: 'Title',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'cannot be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  controller: controller.descriptionController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'cannot be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                DateTimePicker(
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                  dateLabelText: 'Due Date',
                  decoration: InputDecoration(
                    hintText: 'Due Date',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  controller: controller.dueDateController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Cannot be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                ConstrainedBox(
                  constraints:
                      BoxConstraints.tightFor(width: Get.width, height: 40),
                  child: ElevatedButton(
                    onPressed: () {
                      controller.saveUpdateTask(
                        type: type,
                        titel: controller.titleController.text,
                        description: controller.descriptionController.text,
                        dueDate: controller.dueDateController.text,
                        docId: docId,
                      );
                    },
                    child: Text(type!),
                  ),
                ),
              ],
            )),
      ),
    ),
  );
}
