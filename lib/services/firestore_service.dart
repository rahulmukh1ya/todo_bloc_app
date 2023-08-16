import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/task.dart';

class FirestoreService {
  static final CollectionReference _taskCollection =
      FirebaseFirestore.instance.collection('tasks');
  // made the variable static

  Stream<List<Task>> getTask() {
    // _taskCollection.snapshots().listen((event) {
    //   event.docs.map((element) {
    //     print('***************here**********');
    //     print(element.data());
    //   });
    // });

//     FirebaseFirestore.instance.collection('userss').doc('1').snapshots()listen((event) {
//       if(!event.metadata.isFromCache) {
//             print('this data from server');
//             //as (!) condition it should outputs true if data was from server
//             // but as a test i turn off my wifi but it also outputs true .. How !??
//       }
// });

    return _taskCollection.snapshots().map((snapshot) {
      if (!snapshot.metadata.isFromCache) {
        return snapshot.docs.map((doc) {
          print("I am get task method");
          return Task.fromMap(doc.data() as Map<String, dynamic>);
        }).toList();
      } else {
        return [];
      }
    });
  }

  static String setId() {
    return _taskCollection.doc().id;
  } // to provide the unique id for tasks

  Future<void> addTask(Task task) {
    return _taskCollection.doc(task.id).set(task.toMap());
  }

  Future<void> updateTask(Task task) {
    return _taskCollection.doc(task.id).update(task.toMap());
  }

  Future<void> deleteTask(String taskId) {
    return _taskCollection.doc(taskId).delete();
  }
}

// return _taskCollection.snapshots().map((snapshot) {
//   print('I am here');
//   return snapshot.docs.map((doc) {
//     Map<String, dynamic> data = doc.data() as Map<String, dynamic>; //here
//     print(data);
//     return Task.fromMap(data);
//   }).toList();
// });
