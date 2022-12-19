
import 'package:flutter/material.dart';
import 'package:flutter_pertama/app/data/controller/auth_controller.dart';
import 'package:get/get.dart';

class PeopleYouMightKnow extends StatelessWidget {
  final authCon = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        clipBehavior: Clip.antiAlias,
        itemCount: 8,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.circular(50),
                  child: const Image(
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1620231150904-a86b9802656a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1169&q=80'),
                  ),
                ),
                const Positioned(
                  bottom: 10,
                  left: 55,
                  child: Text(
                    "George William",
                    style: TextStyle(
                        color: Colors.white),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: SizedBox(
                    height: 36,
                    width: 36,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton
                          .styleFrom(
                        padding:
                            EdgeInsets.zero,
                        shape:
                            RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius
                                  .circular(50),
                        ),
                      ),
                      child: const Icon(Icons
                          .add_circle_outline),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
