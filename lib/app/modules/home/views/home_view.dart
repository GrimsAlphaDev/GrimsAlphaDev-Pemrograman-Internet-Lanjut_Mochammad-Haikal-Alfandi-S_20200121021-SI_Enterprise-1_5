import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pertama/app/utils/style/AppColors.dart';
import 'package:flutter_pertama/app/utils/widget/header.dart';
import 'package:flutter_pertama/app/utils/widget/myFriends.dart';
import 'package:flutter_pertama/app/utils/widget/sideBar.dart';
import 'package:flutter_pertama/app/utils/widget/upcomingTask.dart';

import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: const SideBar(),
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
                              width: 15,
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
                                Text("Manage Task Made easy with friends",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.primaryText))
                              ],
                            ),
                            const Spacer(),
                            const Icon(
                              AntIcons.bellFilled,
                              color: AppColors.primaryText,
                              size: 30,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: const CircleAvatar(
                                backgroundColor: Colors.amber,
                                radius: 25,
                                foregroundImage: NetworkImage(
                                    'https://images.unsplash.com/photo-1620231150904-a86b9802656a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1169&q=80'),
                              ),
                            )
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
                            SizedBox(
                              height: Get.height * 0.3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "My Task",
                                    style: TextStyle(
                                        color: AppColors.primaryText,
                                        fontSize: 30),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  // My Task
                                  SizedBox(
                                    height: 200,
                                    child: ListView(
                                      clipBehavior: Clip.antiAlias,
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      children: [
                                        Container(
                                          width: 400,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
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
                                                          BorderRadius.circular(
                                                              25),
                                                      child: const CircleAvatar(
                                                        backgroundColor:
                                                            Colors.amber,
                                                        radius: 20,
                                                        foregroundImage:
                                                            NetworkImage(
                                                                'https://images.unsplash.com/photo-1620231150904-a86b9802656a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1169&q=80'),
                                                      ),
                                                    ),
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25),
                                                      child: const CircleAvatar(
                                                        backgroundColor:
                                                            Colors.amber,
                                                        radius: 20,
                                                        foregroundImage:
                                                            NetworkImage(
                                                                'https://images.unsplash.com/photo-1620231150904-a86b9802656a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1169&q=80'),
                                                      ),
                                                    ),
                                                    const Spacer(),
                                                    Container(
                                                      height: 25,
                                                      width: 80,
                                                      color:
                                                          AppColors.primaryBg,
                                                      child: const Center(
                                                          child: Text(
                                                        '100%',
                                                        style: TextStyle(
                                                          color: AppColors
                                                              .primaryText,
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
                                                      color:
                                                          AppColors.primaryText,
                                                    ),
                                                  )),
                                                ),
                                                const Text(
                                                  "Pemrograman Mobile",
                                                  style: TextStyle(
                                                      color:
                                                          AppColors.primaryText,
                                                      fontSize: 20),
                                                ),
                                                const Text(
                                                  "Deadline 2 Hari Lagi",
                                                  style: TextStyle(
                                                      color:
                                                          AppColors.primaryText,
                                                      fontSize: 15),
                                                ),
                                              ]),
                                        ),
                                        Container(
                                          width: 400,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
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
                                                          BorderRadius.circular(
                                                              25),
                                                      child: const CircleAvatar(
                                                        backgroundColor:
                                                            Colors.amber,
                                                        radius: 20,
                                                        foregroundImage:
                                                            NetworkImage(
                                                                'https://images.unsplash.com/photo-1620231150904-a86b9802656a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1169&q=80'),
                                                      ),
                                                    ),
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25),
                                                      child: const CircleAvatar(
                                                        backgroundColor:
                                                            Colors.amber,
                                                        radius: 20,
                                                        foregroundImage:
                                                            NetworkImage(
                                                                'https://images.unsplash.com/photo-1620231150904-a86b9802656a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1169&q=80'),
                                                      ),
                                                    ),
                                                    const Spacer(),
                                                    Container(
                                                      height: 25,
                                                      width: 80,
                                                      color:
                                                          AppColors.primaryBg,
                                                      child: const Center(
                                                          child: Text(
                                                        '100%',
                                                        style: TextStyle(
                                                          color: AppColors
                                                              .primaryText,
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
                                                      color:
                                                          AppColors.primaryText,
                                                    ),
                                                  )),
                                                ),
                                                const Text(
                                                  "Pemrograman Mobile",
                                                  style: TextStyle(
                                                      color:
                                                          AppColors.primaryText,
                                                      fontSize: 20),
                                                ),
                                                const Text(
                                                  "Deadline 2 Hari Lagi",
                                                  style: TextStyle(
                                                      color:
                                                          AppColors.primaryText,
                                                      fontSize: 15),
                                                ),
                                              ]),
                                        ),
                                        Container(
                                          width: 400,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
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
                                                          BorderRadius.circular(
                                                              25),
                                                      child: const CircleAvatar(
                                                        backgroundColor:
                                                            Colors.amber,
                                                        radius: 20,
                                                        foregroundImage:
                                                            NetworkImage(
                                                                'https://images.unsplash.com/photo-1620231150904-a86b9802656a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1169&q=80'),
                                                      ),
                                                    ),
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25),
                                                      child: const CircleAvatar(
                                                        backgroundColor:
                                                            Colors.amber,
                                                        radius: 20,
                                                        foregroundImage:
                                                            NetworkImage(
                                                                'https://images.unsplash.com/photo-1620231150904-a86b9802656a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1169&q=80'),
                                                      ),
                                                    ),
                                                    const Spacer(),
                                                    Container(
                                                      height: 25,
                                                      width: 80,
                                                      color:
                                                          AppColors.primaryBg,
                                                      child: const Center(
                                                          child: Text(
                                                        '100%',
                                                        style: TextStyle(
                                                          color: AppColors
                                                              .primaryText,
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
                                                      color:
                                                          AppColors.primaryText,
                                                    ),
                                                  )),
                                                ),
                                                const Text(
                                                  "Pemrograman Mobile",
                                                  style: TextStyle(
                                                      color:
                                                          AppColors.primaryText,
                                                      fontSize: 20),
                                                ),
                                                const Text(
                                                  "Deadline 2 Hari Lagi",
                                                  style: TextStyle(
                                                      color:
                                                          AppColors.primaryText,
                                                      fontSize: 15),
                                                ),
                                              ]),
                                        ),
                                        Container(
                                          width: 400,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
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
                                                          BorderRadius.circular(
                                                              25),
                                                      child: const CircleAvatar(
                                                        backgroundColor:
                                                            Colors.amber,
                                                        radius: 20,
                                                        foregroundImage:
                                                            NetworkImage(
                                                                'https://images.unsplash.com/photo-1620231150904-a86b9802656a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1169&q=80'),
                                                      ),
                                                    ),
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25),
                                                      child: const CircleAvatar(
                                                        backgroundColor:
                                                            Colors.amber,
                                                        radius: 20,
                                                        foregroundImage:
                                                            NetworkImage(
                                                                'https://images.unsplash.com/photo-1620231150904-a86b9802656a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1169&q=80'),
                                                      ),
                                                    ),
                                                    const Spacer(),
                                                    Container(
                                                      height: 25,
                                                      width: 80,
                                                      color:
                                                          AppColors.primaryBg,
                                                      child: const Center(
                                                          child: Text(
                                                        '100%',
                                                        style: TextStyle(
                                                          color: AppColors
                                                              .primaryText,
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
                                                      color:
                                                          AppColors.primaryText,
                                                    ),
                                                  )),
                                                ),
                                                const Text(
                                                  "Pemrograman Mobile",
                                                  style: TextStyle(
                                                      color:
                                                          AppColors.primaryText,
                                                      fontSize: 20),
                                                ),
                                                const Text(
                                                  "Deadline 2 Hari Lagi",
                                                  style: TextStyle(
                                                      color:
                                                          AppColors.primaryText,
                                                      fontSize: 15),
                                                ),
                                              ]),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            !context.isPhone
                                ? Expanded(
                                    child: Row(
                                      children: const [
                                        UpcomingTask(),
                                        MyFriends(),
                                      ],
                                    ),
                                  )
                                : const UpcomingTask(),
                          ]),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
