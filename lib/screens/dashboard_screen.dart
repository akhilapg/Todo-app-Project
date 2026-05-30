import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/task_service.dart';
import 'appbar_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {

    TaskService taskService = TaskService();

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: PreferredSize(
        preferredSize:
        const Size.fromHeight(kToolbarHeight),

        child: const AppbarScreen(),
      ),
        body: StreamBuilder(
            stream:
            FirebaseFirestore.instance
                .collection('users')
                .doc(
              FirebaseAuth.instance.currentUser!.uid,
            )
                .collection('tasks')
                .snapshots(),
            // FirebaseFirestore.instance
            //     .collection('tasks')
            //     .snapshots(),

            builder: (context, snapshot) {

              if(!snapshot.hasData){

                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              final tasks = snapshot.data!.docs;

              if(tasks.isEmpty){

                return const Center(
                  child: Text("No Tasks Added"),
                );
              }
              return ListView.builder(

                  itemCount: tasks.length,

                  itemBuilder: (context, index){

                    final task = tasks[index];

                    return Card(
                        child: ListTile(

                          leading: Checkbox(
                            value: task['completed'],

                            onChanged: (value) {

                              taskService.updateTask(
                                task.id,
                                value!,
                              );
                            },
                          ),
                          title: Text(task['title']),

                          subtitle: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,

                            children: [
                              Text(task['description']),
                              Text(task['date']),
                            ],
                          ),

                          trailing: IconButton(
                            icon: const Icon(Icons.delete),

                            onPressed: () {
                              taskService.deleteTask(task.id);
                            },
                          ),
                        ),
                    );
                  },
              );
            },
        ),
    );
  }
}