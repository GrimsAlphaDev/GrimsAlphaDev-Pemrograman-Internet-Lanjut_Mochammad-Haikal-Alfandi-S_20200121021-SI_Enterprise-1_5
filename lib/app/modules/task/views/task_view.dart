import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pertama/app/utils/style/AppColors.dart';
import 'package:flutter_pertama/app/utils/widget/header.dart';
import 'package:flutter_pertama/app/utils/widget/sideBar.dart';

import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

import '../controllers/task_controller.dart';

class TaskView extends GetView<TaskController> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: const SizedBox(width: 150, child: SideBar()),
      backgroundColor: AppColors.primaryBg,
      body: SafeArea(
        child: Row(
          children: [
            !context.isPhone
                ? const Expanded(
                    flex: 2,
                    child: SideBar(),
                  )
                : const SizedBox(),
            Expanded(
              flex: 15,
              child: Column(
                children: [
                  !context.isPhone
                      ? const header()
                      : Container(
                          // content / isi page / screen

                          padding: const EdgeInsets.all(20),
                          child: Row(children: [
                            IconButton(
                              onPressed: () {
                                _drawerKey.currentState!.openDrawer();
                              },
                              icon: const Icon(UniconsLine.bars),
                              color: AppColors.primaryText,
                            ),
                            const SizedBox(
                                // width: 15,
                                ),
                            Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Task Management",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: AppColors.primaryText),
                                ),
                                Text(
                                  "Manage Task Made Easy",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.primaryText),
                                ),
                              ],
                            ),
                            const Spacer(),
                            const Icon(
                              AntIcons.bellFilled,
                              color: AppColors.primaryText,
                              size: 30,
                            ),
                            const SizedBox(
                                // width: 15,
                                ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: const CircleAvatar(
                                backgroundColor: Colors.amber,
                                radius: 20,
                                foregroundImage: NetworkImage(
                                    'https://images.unsplash.com/photo-1620231150904-a86b9802656a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1169&q=80'),
                              ),
                            ),
                          ]),
                        ),
                  Expanded(
                    child: Container(
                      padding: !context.isPhone
                          ? const EdgeInsets.all(50)
                          : const EdgeInsets.all(20),
                      margin: !context.isPhone
                          ? const EdgeInsets.all(10)
                          : const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: !context.isPhone
                            ? BorderRadius.circular(50)
                            : BorderRadius.circular(30),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "My Task",
                            style: TextStyle(
                                color: AppColors.primaryText, fontSize: 30),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: 8,
                              clipBehavior: Clip.antiAlias,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onLongPress: () {
                                    addEditTask(
                                        context: context,
                                        type: 'Update',
                                        docId: '2022-12-20T08:40:32.689462');
                                  },
                                  child: Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColors.cardBg,
                                    ),
                                    margin: const EdgeInsets.all(10),
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                child: const CircleAvatar(
                                                  backgroundColor: Colors.amber,
                                                  radius: 20,
                                                  foregroundImage: NetworkImage(
                                                      'https://images.unsplash.com/photo-1620231150904-a86b9802656a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1169&q=80'),
                                                ),
                                              ),
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                child: const CircleAvatar(
                                                  backgroundColor: Colors.amber,
                                                  radius: 20,
                                                  foregroundImage: NetworkImage(
                                                      'https://images.unsplash.com/photo-1620231150904-a86b9802656a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1169&q=80'),
                                                ),
                                              ),
                                              const Spacer(),
                                              Container(
                                                height: 25,
                                                width: 80,
                                                color: AppColors.primaryBg,
                                                child: const Center(
                                                    child: Text(
                                                  '100%',
                                                  style: TextStyle(
                                                    color:
                                                        AppColors.primaryText,
                                                  ),
                                                )),
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          Container(
                                            height: 25,
                                            width: 80,
                                            color: AppColors.primaryBg,
                                            child: const Center(
                                              child: Text(
                                                '10 / 10 Task',
                                                style: TextStyle(
                                                  color: AppColors.primaryText,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const Text(
                                            "Pemrograman Mobile",
                                            style: TextStyle(
                                                color: AppColors.primaryText,
                                                fontSize: 20),
                                          ),
                                          const Text(
                                            "Deadline 2 Hari Lagi",
                                            style: TextStyle(
                                                color: AppColors.primaryText,
                                                fontSize: 15),
                                          ),
                                        ]),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Align(
        alignment: const Alignment(0.95, 0.95),
        child: FloatingActionButton.extended(
            onPressed: () {
              addEditTask(context: context, type: 'Add', docId: '');
            },
            label: const Text("Add Task"),
            icon: const Icon(Icons.add)),
      ),
    );
  }

  addEditTask({BuildContext? context, String? type, String? docId}) {
    Get.bottomSheet(
      SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
          margin: context!.isPhone
              ? EdgeInsets.zero
              : const EdgeInsets.only(left: 150, right: 150),
          // height: Get.height,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: Colors.white),
          child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  Text(
                    '$type Task',
                    style: const TextStyle(
                      color: AppColors.primaryText,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Title',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    controller: controller.tittleController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Cannot be empty';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 5,
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
                        return 'Cannot be empty';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 5,
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
                  const SizedBox(
                    height: 5,
                  ),
                  ConstrainedBox(
                    constraints:
                        BoxConstraints.tightFor(width: Get.width, height: 40),
                    child: ElevatedButton(
                      onPressed: () {
                        controller.saveUpdateTask(
                          controller.tittleController.text,
                          controller.descriptionController.text,
                          controller.dueDateController.text,
                          docId.toString(),
                          type,
                        );
                      },
                      child: Text(type!),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
