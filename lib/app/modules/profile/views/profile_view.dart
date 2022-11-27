import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pertama/app/routes/app_pages.dart';
import 'package:flutter_pertama/app/utils/style/AppColors.dart';
import 'package:flutter_pertama/app/utils/widget/header.dart';
import 'package:flutter_pertama/app/utils/widget/myTask.dart';
import 'package:flutter_pertama/app/utils/widget/profileWidget.dart';
import 'package:flutter_pertama/app/utils/widget/sideBar.dart';

import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: const SideBar(),
      backgroundColor: AppColors.primaryBg,
      body: Row(
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

                        padding: const EdgeInsets.only(top: 30, bottom: 20),
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
                                    fontSize: 20, color: AppColors.primaryText),
                              ),
                              Text("Manage Task Made easy with friends",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.primaryText))
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.defaultDialog(
                                title: 'Sign Out ',
                                content: const Text(
                                    'Are you sure want to sign out ?'),
                                cancel: ElevatedButton(
                                  onPressed: () => Get.back(),
                                  child: const Text('Cancel'),
                                ),
                                confirm: ElevatedButton(
                                  onPressed: () => Get.toNamed(Routes.LOGIN),
                                  child: const Text('Sign Out'),
                                ),
                              );
                            },
                            child: Row(
                              children: const [
                                Text(
                                  'Sign Out',
                                  style: TextStyle(
                                      color: AppColors.primaryText,
                                      fontSize: 16),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  UniconsLine.signout,
                                  color: Colors.grey,
                                  size: 30,
                                ),
                              ],
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        ProfileWidget(),
                        Text(
                          "My Task",
                          style: TextStyle(
                              color: AppColors.primaryText, fontSize: 30),
                        ),
                        SizedBox(
                          height: 200,
                          child: MyTask(),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
