import 'package:flutter/material.dart';
import 'package:task_manager/screens/all_task.dart';
import 'package:task_manager/screens/task_add.dart';
import 'package:task_manager/utils/colors.dart';
import 'package:task_manager/widgets/buttons.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/background.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: const TextSpan(
                  text: 'Hello',
                  style: TextStyle(
                    fontSize: 60,
                    color: AppColors.mainColor,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: '\nEmbrace, conquer, thrive today!',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  ]),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.5,
            ),
            InkWell(
              onTap: () {
                Get.to(() => const AddTask(),
                    transition: Transition.zoom,
                    duration: const Duration(milliseconds: 500));
              },
              child: const Buttons(
                backgroundColor: AppColors.mainColor,
                text: "Add Task",
                textColor: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Get.to(() => const AllTasks(),
                    transition: Transition.fade,
                    duration: const Duration(seconds: 1));
              },
              child: const Buttons(
                backgroundColor: Colors.white,
                text: "View All",
                textColor: AppColors.mainColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
