import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../services/task_service.dart';
import 'appbar_screen.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {

  TextEditingController taskController =
  TextEditingController();

  TextEditingController descriptionController =
  TextEditingController();

  TextEditingController dateController =
  TextEditingController();

  TaskService taskService = TaskService();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,

        appBar: PreferredSize(
          preferredSize:
          const Size.fromHeight(kToolbarHeight),

          child: const AppbarScreen(),
        ),

        body: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [

            TextField(
            controller: taskController,
            decoration: const InputDecoration(
              hintText: "Task Name",
              border: OutlineInputBorder(),
            ),
          ),
            const SizedBox(height: 20),

            TextField(
                controller: dateController,
                readOnly: true,

                decoration: InputDecoration(
                    hintText: "Pick Date",
                    border: const OutlineInputBorder(),

                    suffixIcon: IconButton(
                        icon: const Icon(Icons.calendar_month),

                        onPressed: () async {

                          final DateTime? pickedDate =
                          await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2030),
                          );
                          if(pickedDate != null){

                            String formattedDate =
                            DateFormat('dd-MM-yyyy')
                                .format(pickedDate);

                            setState(() {
                              dateController.text = formattedDate;
                            });
                          }
                        },
                    ),
                ),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: descriptionController,
              maxLines: 4,

              decoration: const InputDecoration(
                hintText: "Description",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
                width: double.infinity,
                height: 50,

                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                      const Color(0xFF800000),
                    ),

                    onPressed: () async {

                      await taskService.addTask(
                        taskController.text,
                        dateController.text,
                        descriptionController.text,
                      );
                      ScaffoldMessenger.of(context)
                          .showSnackBar(

                        const SnackBar(
                          content: Text("Task Added"),
                        ),
                      );

                      taskController.clear();
                      dateController.clear();
                      descriptionController.clear();
                    },

                  child: const Text(
                    "Save Task",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
            ),
            ],
          ),
        ),
    );
  }
}