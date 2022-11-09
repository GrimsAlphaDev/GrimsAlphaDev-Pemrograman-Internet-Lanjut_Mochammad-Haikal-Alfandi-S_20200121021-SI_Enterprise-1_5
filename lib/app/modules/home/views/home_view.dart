import 'package:flutter/material.dart';
import 'package:flutter_pertama/app/utils/widget/sideBar.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        body: Row(
          children: [
            const Expanded(
              flex: 2,
              child: SideBar(),
            ),
            Expanded(
              flex: 15,
              child: Container(color: Colors.white),
            ),
          ],
        ));
  }
}
