import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/model/student.dart';

final studentViewModelProvider =
    ChangeNotifierProvider<StudentViewModel>((ref) => StudentViewModel());

class StudentViewModel extends ChangeNotifier {
  List<Student> students = [];

  void addStudent(Student student) {
    students.add(student);
    notifyListeners();
  }
}