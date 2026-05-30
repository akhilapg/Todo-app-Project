import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TaskService {

  // GET CURRENT LOGGED-IN USER ID
  final String userId =
      FirebaseAuth.instance.currentUser!.uid;

  // USER-SPECIFIC TASK COLLECTION
  CollectionReference get tasks =>
      FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('tasks');

  // ADD TASK
  Future addTask(
      String title,
      String date,
      String description,
      ) async {

    await tasks.add({

      'title': title,
      'date': date,
      'description': description,
      'completed': false,
      'createdAt': Timestamp.now(),
    });
  }

  // DELETE TASK
  Future deleteTask(String id) async {

    await tasks.doc(id).delete();
  }

  // UPDATE TASK COMPLETION
  Future updateTask(
      String id,
      bool completed,
      ) async {

    await tasks.doc(id).update({

      'completed': completed,
    });
  }
}