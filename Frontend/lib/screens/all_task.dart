import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/utils/colors.dart';
import 'package:task_manager/widgets/buttons.dart';
import 'package:task_manager/widgets/task.dart';

class AllTasks extends StatelessWidget {
  const AllTasks({super.key});

  @override
  Widget build(BuildContext context) {
    List myData = [
      "Try Harder",
      "Try Smart",
    ];
    final leftEditIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.black.withOpacity(0.5),
      child: const Icon(
        Icons.edit,
        color: Colors.white,
        size: 20,
      ),
    );
    final rightDeleteIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.redAccent.withOpacity(0.5),
      alignment: Alignment.centerRight,
      child: const Icon(
        Icons.delete,
        color: Colors.white,
        size: 20,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20, top: 60),
            alignment: Alignment.topLeft,
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height / 3.2,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/allTask.jpeg',
                ),
              ),
            ),
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                Icons.arrow_back,
                color: AppColors.secondaryColor,
                size: 30,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                const Icon(
                  Icons.home,
                  color: AppColors.secondaryColor,
                  size: 30,
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.5),
                    color: Colors.black,
                  ),
                  child: const Icon(Icons.add, color: Colors.white, size: 20),
                ),
                Expanded(
                  child: Container(),
                ),
                const Icon(
                  Icons.calendar_month,
                  color: AppColors.secondaryColor,
                  size: 26,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "2",
                  style:
                      TextStyle(fontSize: 20, color: AppColors.secondaryColor),
                ),
              ],
            ),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: myData.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  background: leftEditIcon,
                  secondaryBackground: rightDeleteIcon,
                  key: ObjectKey(index),
                  onDismissed: (DismissDirection direction) {
                    log("After Dismissed");
                  },
                  confirmDismiss: (DismissDirection direction) async {
                    if (direction == DismissDirection.startToEnd) {
                      showModalBottomSheet(
                          barrierColor: Colors.transparent.withOpacity(0.5),
                          backgroundColor:
                              const Color(0xFF2e23253).withOpacity(0.4),
                          context: context,
                          builder: (_) {
                            return Container(
                              height: 500,
                              decoration: const BoxDecoration(
                                color: AppColors.textGrey,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Buttons(
                                      backgroundColor: AppColors.secondaryColor,
                                      text: "View",
                                      textColor: Color.fromARGB(255, 4, 56, 82),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Buttons(
                                      backgroundColor: AppColors.secondaryColor,
                                      text: "Edit",
                                      textColor: Color.fromARGB(255, 4, 56, 82),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                      return false;
                    } else {
                      return Future.delayed(const Duration(seconds: 1),
                          () => direction == DismissDirection.endToStart);
                    }
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Tasks(
                      text: myData[index],
                      color: const Color.fromARGB(255, 4, 56, 82),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


// 1:03