import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/task.dart';

class FirestoreService {
  static final CollectionReference _taskCollection =
      FirebaseFirestore.instance.collection('tasks');
  // made the variable static

  Stream<List<Task>> getTask() {
    return _taskCollection.snapshots().map((snapshot) {
      print('I am here');
      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>; //here
        return Task.fromMap(data);
      }).toList();
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
