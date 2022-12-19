import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pertama/app/data/controller/auth_controller.dart';
import 'package:flutter_pertama/app/utils/style/AppColors.dart';
import 'package:flutter_pertama/app/utils/widget/header.dart';
import 'package:flutter_pertama/app/utils/widget/myFriends.dart';
import 'package:flutter_pertama/app/utils/widget/peopleYouMayKnow.dart';
import 'package:flutter_pertama/app/utils/widget/sideBar.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:unicons/unicons.dart';

import '../controllers/friends_controller.dart';

class FriendsView extends GetView<FriendsController> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  final authCon = Get.find<AuthController>();

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
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Row(children: [
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
                              const SizedBox(
                                height: 10,
                              ),
                              context.isPhone
                                  ? TextField(
                                      onChanged: (value) =>
                                          authCon.searchFriends(value),
                                      controller:
                                          authCon.searchFriendController,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        contentPadding: const EdgeInsets.only(
                                            left: 40, right: 10),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: const BorderSide(
                                              color: Colors.white),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: const BorderSide(
                                              color: Colors.blue),
                                        ),
                                        prefixIcon: const Icon(
                                          Icons.search,
                                          color: Colors.grey,
                                        ),
                                        hintText: 'Search',
                                      ),
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                        ),
                  // content / isi page / screen
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
                      child: Obx(
                        () => authCon.hasilPencarian.isEmpty
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    const Text(
                                      "People You May Know",
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: AppColors.primaryText),
                                    ),
                                    PeopleYouMightKnow(),
                                    MyFriends(),
                                  ])
                            : ListView.builder(
                                padding: const EdgeInsets.only(
                                    top: 10, bottom: 10, left: 0, right: 0),
                                shrinkWrap: true,
                                itemCount: authCon.hasilPencarian.length,
                                itemBuilder: (context, index) => ListTile(
                                  onTap: () => authCon.addFriends(
                                      authCon.hasilPencarian[index]['email']),
                                  leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image(
                                      image: NetworkImage(
                                          authCon.hasilPencarian[index]
                                              ['photo'],
                                          scale: 2),
                                    ),
                                  ),
                                  title: Text(
                                      authCon.hasilPencarian[index]['name']),
                                  subtitle: Text(
                                      authCon.hasilPencarian[index]['email']),
                                  trailing: const Icon(Icons.add),
                                ),
                              ),
                      ),
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
