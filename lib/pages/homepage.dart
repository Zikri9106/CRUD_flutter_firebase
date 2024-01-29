// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:crudflutter/todo_controller.dart';
import 'package:get/get.dart';
import 'package:crudflutter/utils/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TodoController todoController = Get.put(TodoController());

    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: const Text(
          "Daily Note",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: AppColors.textColor),
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Title",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.secondColor,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: titleController,
                  style: const TextStyle(color: AppColors.textColor),
                  decoration: InputDecoration(
                    fillColor: AppColors.primaryColor,
                    filled: true,
                    hintText: 'Enter your Title...',
                    hintStyle: const TextStyle(color: AppColors.hintTextColor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: AppColors.secondColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: AppColors.secondColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Description",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.secondColor,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: descriptionController,
                  style: const TextStyle(color: AppColors.textColor),
                  decoration: InputDecoration(
                    fillColor: AppColors.primaryColor,
                    filled: true,
                    hintText: 'Enter description...',
                    hintStyle: const TextStyle(color: AppColors.hintTextColor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: AppColors.secondColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: AppColors.secondColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                if (titleController.text.isEmpty ||
                    descriptionController.text.isEmpty) {
                  Get.snackbar(
                    "Error",
                    "Title and description cannot be empty",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: AppColors.warningColor,
                    colorText: AppColors.textColor,
                  );
                } else {
                  todoController.title.text = titleController.text;
                  todoController.description.text = descriptionController.text;
                  todoController.addTodo();
                  Get.snackbar(
                    "Success",
                    "Note added successfully",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: AppColors.successColor,
                    colorText: AppColors.textColor,
                    duration: const Duration(milliseconds: 1500),
                  );
                }
              },
              child: Container(
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.secondColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Icon(
                    Icons.done,
                    color: AppColors.textColor,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "ALL NOTES",
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Expanded(
              child: Obx(
                () => ListView(
                  children: todoController.todoList
                      .map((e) => Card(
                            elevation: 5,
                            color: AppColors.backgroundColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              tileColor: AppColors.primaryColor,
                              onTap: () {},
                              title: Text(
                                e.title!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textColor,
                                ),
                              ),
                              subtitle: Text(
                                e.description ?? "",
                                style:
                                    const TextStyle(color: AppColors.textColor),
                              ),
                              trailing: SizedBox(
                                width: 100,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.defaultDialog(
                                          backgroundColor:
                                              AppColors.backgroundColor,
                                          title: "Delete Note",
                                          titleStyle: const TextStyle(
                                              color: AppColors.secondColor,
                                              fontWeight: FontWeight.bold),
                                          content: Container(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const Text(
                                                  "Are you sure you want to delete this Note?",
                                                  style: TextStyle(
                                                      color:
                                                          AppColors.textColor),
                                                  textAlign: TextAlign.center,
                                                ),
                                                const SizedBox(height: 20),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        todoController
                                                            .deleteTodo(e.id!);
                                                        Get.back();
                                                        Get.snackbar(
                                                          "Deleted",
                                                          "Note deleted successfully",
                                                          snackPosition:
                                                              SnackPosition
                                                                  .BOTTOM,
                                                          backgroundColor:
                                                              AppColors
                                                                  .successColor,
                                                          colorText: AppColors
                                                              .textColor,
                                                          duration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      1500),
                                                        );
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            AppColors
                                                                .warningColor,
                                                      ),
                                                      child: const Text(
                                                        "Delete",
                                                        style: TextStyle(
                                                            color: AppColors
                                                                .textColor),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 10),
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        Get.back();
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            AppColors
                                                                .primaryColor,
                                                      ),
                                                      child: const Text(
                                                        "Cancel",
                                                        style: TextStyle(
                                                            color: AppColors
                                                                .textColor),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: AppColors.warningColor,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: const Icon(
                                          Icons.delete,
                                          color: AppColors.textColor,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    InkWell(
                                      onTap: () {
                                        todoController.updatedTitle.text =
                                            e.title!;
                                        todoController.description.text =
                                            e.description ?? "";
                                        Get.defaultDialog(
                                          backgroundColor:
                                              AppColors.backgroundColor,
                                          title: "Update Note",
                                          titleStyle: const TextStyle(
                                              color: AppColors.secondColor),
                                          content: SizedBox(
                                            width: double.infinity,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                TextFormField(
                                                  style: const TextStyle(
                                                      color:
                                                          AppColors.textColor),
                                                  controller: todoController
                                                      .updatedTitle,
                                                  decoration: InputDecoration(
                                                    fillColor:
                                                        AppColors.primaryColor,
                                                    filled: true,
                                                    hintText:
                                                        'Enter updated Title...',
                                                    hintStyle: const TextStyle(
                                                        color: AppColors
                                                            .hintTextColor),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: AppColors
                                                            .secondColor,
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: AppColors
                                                            .secondColor,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                TextFormField(
                                                  style: const TextStyle(
                                                      color:
                                                          AppColors.textColor),
                                                  controller: todoController
                                                      .description,
                                                  maxLines: null,
                                                  keyboardType:
                                                      TextInputType.multiline,
                                                  decoration: InputDecoration(
                                                    fillColor:
                                                        AppColors.primaryColor,
                                                    filled: true,
                                                    hintText:
                                                        'Enter updated Description...',
                                                    hintStyle: const TextStyle(
                                                        color: AppColors
                                                            .hintTextColor),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: AppColors
                                                            .secondColor,
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: AppColors
                                                            .secondColor,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    if (todoController
                                                            .updatedTitle
                                                            .text
                                                            .isEmpty ||
                                                        todoController
                                                            .description
                                                            .text
                                                            .isEmpty) {
                                                      Get.snackbar(
                                                        "Error",
                                                        "Title and description cannot be empty",
                                                        snackPosition:
                                                            SnackPosition
                                                                .BOTTOM,
                                                        backgroundColor:
                                                            AppColors
                                                                .warningColor,
                                                        colorText:
                                                            AppColors.textColor,
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    1500),
                                                      );
                                                    } else {
                                                      todoController
                                                          .updateTodo(e);
                                                      Get.back();
                                                    }
                                                  },
                                                  child: Container(
                                                    height: 45,
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          AppColors.secondColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: const Center(
                                                      child: Icon(
                                                        Icons.done,
                                                        color:
                                                            AppColors.textColor,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: AppColors.editButtonColor,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: const Icon(
                                          Icons.edit,
                                          color: AppColors.textColor,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
