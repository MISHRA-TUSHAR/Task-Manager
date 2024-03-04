import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/utils/colors.dart';
import 'package:task_manager/widgets/buttons.dart';
import 'package:task_manager/widgets/textfields.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController detailController = TextEditingController();
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              'assets/addTask.png',
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon:
                      const Icon(Icons.arrow_back, color: AppColors.mainColor),
                ),
              ],
            ),
            Column(
              children: [
                TextFieldWidgets(
                  textController: nameController,
                  hintText: 'Task Name',
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFieldWidgets(
                  textController: nameController,
                  hintText: 'Task Details',
                  borderRadius: 15,
                  maxLines: 3,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Buttons(
                  backgroundColor: AppColors.mainColor,
                  text: "Add",
                  textColor: Colors.white,
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 9,
            ),
          ],
        ),
      ),
    );
  }
}
