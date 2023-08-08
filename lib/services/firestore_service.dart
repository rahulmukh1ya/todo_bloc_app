import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/task.dart';

class FirestoreService {
  final CollectionReference _taskCollection =
      FirebaseFirestore.instance.collection('tasks');

  Stream<List<Task>> getTask() {
    return _taskCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return Task.fromMap(data);
      }).toList();
    });
  }

  Future<void> addTask(Task task) {
    return _taskCollection.add(task.toMap());
  }

  Future<void> updateTask(Task task) {
    return _taskCollection.doc(task.id).update(task.toMap());
  }

  Future<void> deleteTask(String taskId) {
    return _taskCollection.doc(taskId).delete();
  }
}
